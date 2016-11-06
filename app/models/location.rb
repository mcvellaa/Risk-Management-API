class Location < ActiveRecord::Base

    # Relationships
    belongs_to :event
    has_many :assignments

end
