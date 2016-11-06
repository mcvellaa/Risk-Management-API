class Assignment < ActiveRecord::Base
    
    # Relationships
    belongs_to :event
    belongs_to :location
    belongs_to :user

end
