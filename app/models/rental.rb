class Rental < ApplicationRecord
    belongs_to :user, :foreign_key => :userId
    belongs_to :book, :foreign_key => :isbn
end
