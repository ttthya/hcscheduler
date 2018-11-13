class DropMigration < ActiveRecord::Migration[5.2]
 def up
  drop_table :migrations
 end

 def down
    create_table :migrations do |t|
      t.string :add_admin_to_users

      t.timestamps
    end
 end
end
