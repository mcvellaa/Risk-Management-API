class Datum < ActiveRecord::Base

    # Relationships
    belongs_to :user
    belongs_to :event
    belongs_to :question

end
