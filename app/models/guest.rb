class Guest < ActiveRecord::Base

    # Relationships
    has_many :invitations
    has_many :events, through: :invitations
    has_many :check_ins, through: :invitations
    has_many :check_outs, through: :invitations

    # Validations
    validates_uniqueness_of :name, :phone

    scope :for_user,  ->(auth_token) { joins(:invitation).joins(:user).where('auth_token = ?', auth_token) }
    scope :for_event, ->(event_id)   { joins(:invitation).joins(:events).where('event_id = ?', event_id) }

end
