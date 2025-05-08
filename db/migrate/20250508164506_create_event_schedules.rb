class CreateEventSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :event_schedules do |t|
      t.string :title
      t.references :event, null: false, foreign_key: true
      t.time :start
      t.time :finish
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
