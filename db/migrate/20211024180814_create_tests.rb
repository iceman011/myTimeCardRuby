class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :comment
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
