class RemoveFbFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :path_to_fb_info
  end
end
