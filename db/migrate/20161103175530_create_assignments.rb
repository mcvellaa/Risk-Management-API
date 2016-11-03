class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :event_id
      t.integer :location_id
      t.integer :user_id
      t.datetime :start
      t.datetime :end
      t.boolean :attended

      t.timestamps null: false
    end
  end
end
