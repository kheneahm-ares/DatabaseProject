class Order < ApplicationRecord
  has_many :order_items
  before_save :set_subtotal

  def total
    total = 0
    order_items.collect do |x|
      total += 1
    end
    total
	end

	private
		def set_subtotal
			self[:total] = total
		end
end
