class CheckIn < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :invitation
    has_many :events, through: :invitations

    scope :for_user,  ->(auth_token) { joins(:user).where('auth_token = ?', auth_token) }
    scope :for_event, ->(event_id)   { joins(:invitation).joins(:events).where('event_id = ?', event_id) }

end
