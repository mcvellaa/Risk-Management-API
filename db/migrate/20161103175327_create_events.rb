class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :start
      t.datetime :end
      t.integer :max_attendance
      t.datetime :time_to_send_invites
      t.datetime :list_close

      t.timestamps null: false
    end
  end
end
