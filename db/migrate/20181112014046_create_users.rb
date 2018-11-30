class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :studentId, null: false 
      t.string :classNo
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :studentId, unique: true
      t.index :email, unique: true
    end
  end
end
