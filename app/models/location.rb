class Location < ActiveRecord::Base

    # Relationships
    belongs_to :event
    has_many :assignments

    scope :for_event, ->(event_id)   { joins(:events).where('event_id = ?', event_id) }

end
