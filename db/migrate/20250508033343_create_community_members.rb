class CreateCommunityMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :community_members do |t|
      t.references :community, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :joined_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
