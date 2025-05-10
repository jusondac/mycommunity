class CreateFinances < ActiveRecord::Migration[8.0]
  def change
    create_table :finances do |t|
      t.references :community, null: false, foreign_key: true
      t.text :description
      t.float :price
      t.integer :period
      t.float :balance

      t.timestamps
    end
  end
end
