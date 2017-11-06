class Book < ApplicationRecord
  belongs_to :category, :foreign_key => :categoryId
  validates :isbn, :title, :pages, :publisher, :copiesLeft, :categoryId, presence: true

end
