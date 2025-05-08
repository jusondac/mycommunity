class CreateEventCommunities < ActiveRecord::Migration[8.0]
  def change
    create_table :event_communities do |t|
      t.integer :role
      t.references :user, null: false, foreign_key: true
      t.references :community, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
