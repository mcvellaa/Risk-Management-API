class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :question_id
      t.string :response

      t.timestamps null: false
    end
  end
end
