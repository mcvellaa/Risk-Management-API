class Event < ActiveRecord::Base

    # Relationships
    has_many :locations
    has_many :assignments
    has_many :feedbacks
    has_many :data
    has_many :questions, through: :data
    has_many :invitations
    has_many :check_ins, through: :invitations
    has_many :check_outs, through: :invitations
    has_many :event_users
    has_many :users, through: :event_users
    has_many :guests, through: :invitations

end
