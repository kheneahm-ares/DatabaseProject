class Notification < ApplicationRecord
    belongs_to :rental, :foreign_key => :rentalId
    belongs_to :user, :foreign_key => :userId
end
