class CreateEmps < ActiveRecord::Migration[6.1]
  def change
    create_table :emps do |t|
      t.string :user_name
      t.integer :emp_id
      t.integer :role
      t.string :email
      t.boolean :isManager
      #t.string :password_digest #for storing crypted passwords

      t.string :comment

      t.timestamps
    end
  end
end
