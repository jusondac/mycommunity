class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.references :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
