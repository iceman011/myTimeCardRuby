class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      
      t.integer :clm_work_item_id
      t.integer :task_type_id
      t.datetime :start_time
      t.datetime :end_time
      t.time :duration
      t.string :comment
      
      t.references :emp, null: false, foreign_key: true

      t.timestamps
    end
  end
end
