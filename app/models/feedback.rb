class Feedback < ActiveRecord::Base

    # Relationships
    belongs_to :event

    scope :for_event, ->(event_id)   { joins(:event).where('event_id = ?', event_id) }

end
