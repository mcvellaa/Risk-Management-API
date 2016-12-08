class Guest < ActiveRecord::Base

    # Relationships
    has_many :invitations
    has_many :events, through: :invitations
    has_many :check_ins, through: :invitations
    has_many :check_outs, through: :invitations
    has_many :users, through: :invitations

    scope :for_user_and_event,    ->(auth_token, event_id) { joins(:invitations).joins(:users).where('users.auth_token = ? AND invitations.event_id = ?', auth_token, event_id) }
    scope :for_event,   ->(event_id)   { joins(:invitations).joins(:events).where('invitations.event_id = ?', event_id) }

    def self.search(search)
      where("LOWER(name) LIKE ?", "%#{search}%")
    end

end
