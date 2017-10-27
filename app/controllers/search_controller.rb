class SearchController < ApplicationController

  def books
    @search = params[:search]
    @books = Book.where("title like :query", query: "%#{@search}%")
  end
end
