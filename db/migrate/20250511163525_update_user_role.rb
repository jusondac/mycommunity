class UpdateUserRole < ActiveRecord::Migration[8.0]
  def change
		rename_column :users, :role_id, :role
		change_column :users, :role, :integer
  end
end
