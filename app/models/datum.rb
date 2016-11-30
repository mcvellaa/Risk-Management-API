class Datum < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :event
    belongs_to :question

    scope :for_user,  ->(auth_token) { joins(:user).where('auth_token = ?', auth_token) }
    scope :for_event, ->(event_id)   { joins(:events).where('event_id = ?', event_id) }

end
