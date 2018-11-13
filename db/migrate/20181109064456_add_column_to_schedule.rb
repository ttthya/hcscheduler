class AddColumnToSchedule < ActiveRecord::Migration[5.2]
  def change
   add_column :schedules, :subject, :string

   remove_column :schedules, :subjectId, :integer
  end
end
