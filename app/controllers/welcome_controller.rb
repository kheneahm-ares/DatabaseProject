class WelcomeController < ApplicationController
  def index
    @order_item = current_order.order_items.new
    @books = Book.limit(3)
  end

  def show

  end

end
