class Guest < ActiveRecord::Base

    # Relationships
    has_many :invitations
    has_many :events, through: :invitations
    has_many :check_ins, through: :invitations
    has_many :check_outs, through: :invitations

    # Validations
    validates_uniqueness_of :name, :phone

end
