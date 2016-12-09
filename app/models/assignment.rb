class Assignment < ActiveRecord::Base
    
    # Relationships
    belongs_to :event
    belongs_to :location
    belongs_to :user

    scope :for_user,  ->(auth_token) { joins(:user).where('auth_token = ?', auth_token) }
    scope :for_event, ->(event_id)   { joins(:event).where('event_id = ?', event_id) }

end
