class SearchController < ApplicationController

  def books
    @search = params[:search]
    @books = Book.where("title like :query", query: "%#{@search}%")
    @order_item = current_order.order_items.new

  end

  def allbooks
    @books = Book.all.order("updated_at asc")

  end

  def index

  end
end
