class Question < ActiveRecord::Base

    # Relationships
    has_many :data
    has_many :events, through: :data
    has_many :users, through: :data

end
