require 'pdf-reader'
require 'csv'
require 'date'
require 'holiday_jp'

path = "lib/tasks/pdf/test3.pdf"

File.open(path) do |io|
  # インスタンス化
  reader = PDF::Reader.new(io)

 # PDF情報出力
#  puts reader.pdf_version
#  puts reader.info
#  puts reader.page_count
#  puts reader.metadata
#  puts reader.objects

#texts[]にxxx.pdfを格納
  texts = []
  reader.pages.each do |page|
   texts << page.text  
  end

#  p texts
#xxx.txtに出力
  file = File.open("lib/tasks/text/output.txt","w")
  file.puts texts
  file.close 

#xxx.txtを読み込み、""(空白)で区切り","で１行ずつputs
  File.foreach("lib/tasks/text/output.txt"){ |line|
   p line.split
   texts << line.split   
  }
 
  puts "=========================================="

#日付
  month = 10 
  d = Date.new(2018, month, 1)

  week_name = %w[日 月 火 水 木 金 土]

  while d.month == month# 入力された月を超えたらやめる
   p "#{d.year}-#{d.month}-#{d.day}"
   str = "#{d.month}/#{d.day}#{week_name[d.wday]}曜日"
  # 土か日曜日だったら(休)をつける
    if d.wday == 0 || d.wday == 6
        str += "(休)"
    end
    puts str

    d = d.next
  end  
 
   subject = texts[7][1]
   p subject
   p   subject.class
   
 
#holiday_jp test
  holidays = HolidayJp.between(Date.new(2018,month,1), Date.new(2018,month,31))
  p  holidays.first.name
  p "#{holidays.first.date}"
  p "#{holidays.first.date}".class

  sports = Date.new(2018,10,8)
  p HolidayJp.holiday?(sports).nil?
  sports = sports.next
  p HolidayJp.holiday?(sports).nil?


#授業を１日毎に配列にCSV形式で格納
 
  



  
  # ページ単位で読み込み、テキスト出力
#  reader.pages.each do |page|

#    puts "======================================="
#    puts page
#    puts "======================================="
#    puts page.text#[1000..2000]
#このpage.textは何の型なのか詳細
#    File.write("lib/tasks/text/output.txt",texts)
    
end
