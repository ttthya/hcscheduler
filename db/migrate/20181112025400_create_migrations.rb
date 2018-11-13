class CreateMigrations < ActiveRecord::Migration[5.2]
  def change
    create_table :migrations do |t|
      t.string :add_admin_to_users

      t.timestamps
    end
  end
end
