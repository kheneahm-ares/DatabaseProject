class Book < ApplicationRecord
  belongs_to :category, :foreign_key => :categoryId
end
