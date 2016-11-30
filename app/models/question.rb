class Question < ActiveRecord::Base

    # Relationships
    has_many :data
    has_many :events, through: :data
    has_many :users, through: :data

    scope :for_event, ->(event_id)   { joins(:datum).joins(:events).where('event_id = ?', event_id) }

end
