class CheckoutsController < ApplicationController
  def index
    @checkouts = current_user.checkouts
  end

  def new
    @checkout = Checkout.new
    @book = Book.find(params[:book_id])
  end

  def create
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      redirect_to checkouts_path, notice: "Your book was checked out successfully."
    else
      render "new"
    end
  end

  def destroy
    @checkout = Checkout.find(params[:id])
    @checkout.destroy
    redirect_to checkouts_path
  end

  private
  def checkout_params
    params.require(:checkout).permit(:user_id, :book_id)
  end

end
