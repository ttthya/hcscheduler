class SchedulesController < ApplicationController
  require 'csv'
  require 'open-uri'
  require 'pdf-reader'
  require 'holiday_jp'
  require 'active_support/core_ext/object/try'


  before_action :require_admin, only: [:new,:create,:destroy]



  def index
   @schedules = Schedule.all
  end

  def show
   @schedule = Schedule.find(params[:id])
  end

  def new
   @schedule = Schedule.new
  end

  def edit
   @schedule = Schedule.find(params[:id])
  end


  def create

#出力されたpdfのtxtを読み込む
   dpm = params[:schedule][:dpm]
   pdf_read_to_write(dpm)
   outputPath = "public/txt/"+dpm+"/output.txt"
   scheduleTime = []
   File.foreach(outputPath){ |line|
    scheduleTime << line.split
   }
#   classNoArray = []
   classHash = {}
   scheduleNumber=0
   classRow = 0
   scheduleTime.each do |one,two|
    case [one =="1",one.try(:include?,"R"),one&.length == 4]
#include?がエラーのため、tryを使用　lengthがnilを参照するときエラーのためお尻に&で解決
    when [true,false,false]
     classRow =scheduleNumber 
    when [false,true,true]
     classHash[one] = classRow
    end
    scheduleNumber+=1
   end 

  # schedule.save!を最後に入れる
   year = params[:schedule]["datenow(1i)"].to_i
   month = params[:schedule]["datenow(2i)"].to_i
   day = params[:schedule]["datenow(3i)"].to_i
#year,monthを入力してもらって、取得
   scheDate = Date.new(year,month,day)
   dateCount = 0
#取得した月と対象の日の月が等しい
   while scheDate.month == month
#土、日、祝日かどうか
    case [scheDate.wday == 6, scheDate.wday == 0, HolidayJp.holiday?(scheDate).nil?]
    when [false,false,true]
#学校のある日
     p "#{scheDate.year}-#{scheDate.month}-#{scheDate.day}"    
     classHash.each do |key,value|
#ずれてる直すのは後で
#1flame
      schedule = Schedule.new
      schedule.scheduleDate=scheDate
      schedule.classNo=key
      schedule.subject=scheduleTime[value][dateCount+1]
      schedule.classroom=scheduleTime[value+1][dateCount]
      schedule.flame=1
      schedule.save
#2flame
      schedule = Schedule.new
      schedule.scheduleDate=scheDate
      schedule.classNo=key
      schedule.subject=scheduleTime[value+2][dateCount+2]
      schedule.classroom=scheduleTime[value+3][dateCount]
      schedule.flame=2
      schedule.save
#3flame
      schedule = Schedule.new
      schedule.scheduleDate=scheDate
      schedule.classNo=key
      schedule.subject=scheduleTime[value+4][dateCount+2]
      schedule.classroom=scheduleTime[value+5][dateCount]
      schedule.flame=3
      schedule.save
#4flame
      if scheduleTime[value+6][dateCount] != 1
       schedule = Schedule.new
       schedule.scheduleDate=scheDate
       schedule.classNo=key
       schedule.subject=scheduleTime[value+6][dateCount]
       schedule.classroom=scheduleTime[value+7][dateCount]
       schedule.flame=4
       schedule.save
      end
     end
     scheDate = scheDate.next
    else
     scheDate = scheDate.next
    end 
   end
   redirect_to schedules_url, notice: "時間割を登録しました" 
  end

  def update
   schedule = Schedule.find(params[:id])
   schedule.update!(schedule_params)
   redirect_to schedules_url, notice: "時間割「#{schedule.scheduleDate}の#{schedule.flame}コマ目」を変更しました"
  end
   
  def destroy
   schedule = Schedule.find(params[:id])
   schedule.destroy
   redirect_to schedules_url, notice: "時間割「#{schedule.scheduleDate}の#{schedule.flame}コマ目」を削除しました"
  end

  def upload
   @upload_file = UploadFile.new( params.require(:upload_file).permit(:name,:file))
   @upload_file.save
   redirect_to schedules_url, notice: "時間割のファイルをアップロードしました"
  end


  def import
   @schedule.import(params[:file])
   p "===============I can get================"
  end

 private

  def schedule_params
   params.require(:schedule).permit(:scheduleDate, :classNo, :flame, :subject, :classroom, :remarks, :pdf)
  end
 
  def require_admin
   redirect_to root_path unless current_user.admin?
  end

  def pdf_read_to_write(dpm)
   inputPath = "public/pdf/"+dpm+"/input.pdf"
   
   File.open(inputPath) do |io|
    reader = PDF::Reader.new(io)
    texts = []
    reader.pages.each do |page|
     texts << page.text
    end
   
   outputPath = "public/txt/"+dpm+"/output.txt"
   file = File.open(outputPath,"w")
   file.puts texts
   file.close

   end
  end  

end
