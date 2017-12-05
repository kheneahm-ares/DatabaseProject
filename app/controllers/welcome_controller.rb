class WelcomeController < ApplicationController
  def index
    @order_item = current_order.order_items.new
  end
  def about

  end

  def contact

  end

  def show

  end

  def hours

  end

  def events

  end

end
