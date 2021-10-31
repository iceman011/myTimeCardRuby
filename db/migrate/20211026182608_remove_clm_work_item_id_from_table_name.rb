class RemoveClmWorkItemIdFromTableName < ActiveRecord::Migration[6.1]
  def change
    remove_column :clm_work_items, :clm_work_item_id, :integer
  end
end
