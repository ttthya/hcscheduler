class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :classNo
      t.integer :flame
      t.integer :subjectId
      t.integer :classroom
      t.text :remarks

      t.timestamps
    end
  end
end
