class CreateCommunityFinances < ActiveRecord::Migration[8.0]
  def change
    create_table :community_finances do |t|
      t.references :payment, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true

      t.timestamps
    end
  end
end
