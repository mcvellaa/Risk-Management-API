class EventUser < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :event

    scope :for_user,  ->(auth_token) { joins(:user).where('auth_token = ?', auth_token) }
    scope :for_event, ->(event_id)   { where('event_id = ?', event_id) }
    scope :for_user_and_event, ->(user_id, event_id)   { where('user_id = ? AND event_id = ?', user_id, event_id) }
    #make a validation where the user and event combo must be unique

end
