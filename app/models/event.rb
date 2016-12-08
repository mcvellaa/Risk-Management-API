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

    scope :for_user,  ->(auth_token) { joins(:event_users).joins(:users).where('auth_token = ?', auth_token) }
    scope :upcoming, -> { where('start >= ?', Date.current) }
    scope :past, -> { where('date < ?', Date.current) }

    def self.invite_code
        (0...8).map { (65 + rand(26)).chr }.join
    end

end
