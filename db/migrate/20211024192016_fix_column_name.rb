class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :emps, :emp_id, :employee_id
  end
end
