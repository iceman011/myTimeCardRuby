class RemovePasswordFromEmps < ActiveRecord::Migration[6.1]
  def change
    remove_column :emps, :password
  end
end
