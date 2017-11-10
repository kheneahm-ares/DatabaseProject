class Book < ApplicationRecord
  belongs_to :category, :foreign_key => :categoryId
  belongs_to :author, :foreign_key => :authorId
end
