class Book < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.lackuna.com/wp-content/themes/fearless/images/missing-image-640x360.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :category, :foreign_key => :category_id
  belongs_to :author, :foreign_key => :author_id
  has_many :order_items
  validates :isbn, :title, :pages, :publisher, :copiesLeft, :category_id, presence: true

end
