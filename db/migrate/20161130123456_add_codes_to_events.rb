class AddCodesToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :admin_invite_code, :string
  	add_column :events, :team_invite_code, :string
  	add_column :events, :member_invite_code, :string
  end
end