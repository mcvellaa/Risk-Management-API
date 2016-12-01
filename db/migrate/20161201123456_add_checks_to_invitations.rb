class AddChecksToInvitations < ActiveRecord::Migration
  def change
  	add_column :invitations, :checked_in, :boolean, default: false
  end
end