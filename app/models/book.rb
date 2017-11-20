class Book < ApplicationRecord
  belongs_to :category, :foreign_key => :categoryId
  belongs_to :author, :foreign_key => :authorId
  has_many :rentals
  validates :isbn, :title, :pages, :publisher, :copiesLeft, :categoryId, presence: true

end
