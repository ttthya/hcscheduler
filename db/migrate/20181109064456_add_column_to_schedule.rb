class AddColumnToSchedule < ActiveRecord::Migration[5.2]
  def change
   add_column :schedules, :subject, :string
   add_column :schedules, :scheduleDate, :date

   remove_column :schedules, :subjectId, :integer
   remove_column :schedules, :date, :date
  end
end
