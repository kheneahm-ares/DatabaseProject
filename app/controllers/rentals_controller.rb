class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /rentals
  # GET /rentals.json

  def index
    @current_rentals = Rental.where("userId = ? and isReturned = 0", current_user.id)
    @past_rentals = Rental.where("userId = ? and isReturned = 1", current_user.id).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @rental = Rental.new
  end

  # GET /rentals/1/edit
  def edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    #@rental = Rental.new(rental_params)
    @rental = Rental.new
    @rental.dateRented = Date.current
    @rental.dateDue = Date.current.next_month
    @rental.daysLeft = (Date.current.next_month - Date.current).to_i
    @rental.isRenewed = 0
    @rental.isReturned = 0
    @rental.fee = 0.00
    @rental.userId = current_user.id
    @rental.isbn = params["isbn"]

    respond_to do |format|
      if @rental.save
        @book = Book.find_by isbn: params["isbn"]
        @book.copiesLeft = params["copies"].to_i - 1
        @book.save

        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    @rental = Rental.find(params["id"])
    @rental.isReturned = 1
    @rental.dateReturned = Date.current

    respond_to do |format|
      if @rental.save
        @book = Book.find_by isbn: params["isbn"]
        @book.copiesLeft = params["copies"].to_i + 1
        @book.save

        format.html { redirect_to @rental, notice: 'Rental was successfully returned.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/renew/1
  # PATCH/PUT /rentals/renew/1.json
  def renew
    @rental = Rental.find(params["id"])
    @rental.dateDue = params["date"].to_date + 2.weeks
    @rental.daysLeft = ((params["date"].to_date + 2.weeks) - Date.current).to_i
    @rental.isRenewed = 1

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully renewed.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params["id"])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:dateRented, :dateDue, :daysLeft, :isRenewed, :isReturned, :dateReturned, :fee)
    end
end
