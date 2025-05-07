class CreateCommunities < ActiveRecord::Migration[8.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :descriptions

      t.timestamps
    end
  end
end
