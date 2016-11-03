class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :event_id
      t.string :from
      t.datetime :datetime
      t.string :text

      t.timestamps null: false
    end
  end
end
