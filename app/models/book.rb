class Book < ApplicationRecord
  belongs_to :category, :foreign_key => :category_id
  belongs_to :author, :foreign_key => :author_id
  has_many :order_items
  validates :isbn, :title, :pages, :publisher, :copiesLeft, :category_id, presence: true

end
