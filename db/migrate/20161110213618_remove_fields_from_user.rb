class RemoveFieldsFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :last_logged_on
  	remove_column :users, :date_joined
  end
end
