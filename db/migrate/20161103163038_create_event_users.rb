class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :role, default: "Member"
      t.string :last_location
      t.datetime :location_datetime

      t.timestamps null: false
    end
  end
end
