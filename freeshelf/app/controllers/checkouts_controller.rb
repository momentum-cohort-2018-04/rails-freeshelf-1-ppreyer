class CheckoutsController < ApplicationController
  def index
    @checkouts = Checkout.all
  end
  def new
    @checkout = Checkout.new
  end
  def show
    @checkout = Book.find(params[:id])
  end
  def create
    @checkout = Checkout.new(checkout_params)
    if @checkout.save
      redirect_to @checkouts, notice: "Your book checkout was created successfully."
    else
      render 'index'
    end
  end
  def update
    @checkout = checkout.find(params[:id])
 
    if @checkout.update(checkout_params)
      redirect_to "/checkout", notice: "Your book checkout was updated successfully."
    else
      render 'edit'
    end
  end

  private
  def checkout_params
    params.permit(:checkout)
  end
end
