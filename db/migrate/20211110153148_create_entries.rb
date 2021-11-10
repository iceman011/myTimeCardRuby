class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|

      t.integer "clm_work_item_id"
      t.integer "task_type_id"
      t.datetime "start_time"
      t.datetime "end_time"
      t.time "duration"
      t.string "comment"
      t.integer "card_id"
      t.timestamps
    end
  end
end
