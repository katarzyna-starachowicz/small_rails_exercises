class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :title
      t.text :description
      t.integer :creator_id, index: true

      t.timestamps null: false
    end
  end
end
