class Invitation < ActiveRecord::Base

    # Relationships
    belongs_to :guest
    belongs_to :event
    belongs_to :user
    has_many :check_ins
    has_many :check_outs

end
