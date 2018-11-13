class SchedulesController < ApplicationController

  def index
   @schedules = Schedule.all
  end

  def show
  end

  def new
   @schedule = Schedule.new
  end

  def edit
   @schedule = Schedule.find(params[:id])
  end

  def create
   schedule = Schedule.new(schedule_params)
   schedule.save!
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

 private

  def schedule_params
   params.require(:schedule).permit(:scheduleDate, :classNo, :flame, :subject, :classroom, :remarks)
  end
end
