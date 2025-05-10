class CreateFinancials < ActiveRecord::Migration[8.0]
  def change
    create_table :financials do |t|
      t.references :community, null: false, foreign_key: true
      t.text :description
      t.float :price
      t.integer :period

      t.timestamps
    end
  end
end
