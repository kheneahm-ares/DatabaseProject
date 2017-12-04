class OrderItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def order_all
    @order_items = current_order.order_items
    @order_items.each do |item|
      @rental = Rental.new
      @rental.dateRented = Date.current
      @rental.dateDue = Date.current.next_month
      @rental.daysLeft = (Date.current.next_month - Date.current).to_i
      @rental.isRenewed = 0
      @rental.isReturned = 0
      @rental.fee = 0.00
      @rental.userId = current_user.id
      @rental.isbn = item.book_id
      if(@rental.save)
        @book = Book.find(item.book_id)
        @book.copiesLeft = @book.copiesLeft - 1
        @book.save
        item.destroy
      end
    end
    redirect_to "/rentals"
  end

  def create
		@order = current_order
		@order_item = @order.order_items.new(order_item_params)

		@order.save
		session[:order_id] = @order.id
    redirect_to "/carts/show/"

	end

	def update
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
		@order_items = @order.order_items
	end

	def destroy
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.destroy
		@order_items = @order.order_items
    redirect_to "/carts/show/"
	end

	private
		def order_item_params
			params.require(:order_item).permit(:book_id, :quantity)
		end
end
