class Invitation < ActiveRecord::Base

    # Relationships
    belongs_to :guest
    belongs_to :event
    belongs_to :user
    has_many :check_ins
    has_many :check_outs

    scope :for_user,  ->(auth_token) { joins(:users).where('auth_token = ?', auth_token) }
    scope :for_event, ->(event_id)   { joins(:events).where('event_id = ?', event_id) }

end
