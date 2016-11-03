class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :path_to_fb_info
      t.datetime :last_logged_on
      t.datetime :date_joined

      t.timestamps null: false
    end
  end
end
