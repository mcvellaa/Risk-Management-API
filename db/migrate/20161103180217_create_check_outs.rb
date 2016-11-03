class CreateCheckOuts < ActiveRecord::Migration
  def change
    create_table :check_outs do |t|
      t.integer :user_id
      t.integer :invitation_id
      t.datetime :time

      t.timestamps null: false
    end
  end
end
