class CheckOut < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :invitation
    has_many :events, through: :invitations

end
