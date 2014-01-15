class FighterUser < ActiveRecord::Base
    belongs_to :fighter
    belongs_to :user
end
