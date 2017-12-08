class WelcomeController < ApplicationController
  def index
    @order_item = current_order.order_items.new
    @books = Book.limit(3)
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
    @meetings = Meeting.all
  end


    def report
      @books = Book.order(rental_count: :desc).limit(3)
      @book1 = @books[0]
      @book2 = @books[1]
      @book3 = @books[2]


    end

end
