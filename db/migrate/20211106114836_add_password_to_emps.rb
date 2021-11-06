class AddPasswordToEmps < ActiveRecord::Migration[6.1]
  def change
    add_column :emps, :password_digest, :string
  end
end
