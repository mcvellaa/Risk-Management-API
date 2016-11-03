class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :event_id
      t.integer :location_id
      t.string :description

      t.timestamps null: false
    end
  end
end
