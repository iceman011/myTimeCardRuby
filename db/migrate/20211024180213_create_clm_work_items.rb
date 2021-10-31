class CreateClmWorkItems < ActiveRecord::Migration[6.1]
  def change
    create_table :clm_work_items do |t|
      
      t.integer :clm_work_item_id
      t.integer :clm_parent_ref
      t.integer :clm_child_ref
      t.string  :clm_title
      t.string  :clm_workitem_type
      t.string  :clm_impl_team
      
      t.string :comment

      t.timestamps
    end
  end
end
