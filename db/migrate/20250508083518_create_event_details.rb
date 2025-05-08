class CreateEventDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :event_details do |t|
      t.datetime :date
      t.datetime :start
      t.datetime :finish
      t.float :price
      t.text :descriptions
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
