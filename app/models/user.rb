class User < ActiveRecord::Base

    # Relationships
    has_many :event_users
    has_many :events, through: :event_users
    has_many :check_outs
    has_many :check_ins
    has_many :invitations
    has_many :guests, through: :invitations
    has_many :data
    has_many :assignments
    has_many :locations, through: :assignments
    has_many :questions, through: :data

    # Validations
    scope :for_user,  ->(auth_token) { where('auth_token = ?', auth_token) }
    validates_uniqueness_of :auth_token, case_sensitive: false


end
