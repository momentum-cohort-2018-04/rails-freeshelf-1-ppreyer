class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    if current_user
      @book = Book.new
    else
      redirect_to new_login_path, alert: "Please log in first."
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    if current_user
      @book = Book.new(book_params)
      if @book.save
        redirect_to "/books", notice: "Your book was created successfully."
      else
        render 'new'
      end
    elsif !current_user
      redirect_to new_login_path, alert: "Please log in first."
    end
  end

  def update
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to "/books", notice: "You need to be the book's creator to do this."
    elsif current_user.id = @book.user_id 
      @book.update(book_params)
      redirect_to "/books", notice: "Your book was updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if current_user and current_user.id != @book.user_id
      redirect_to "/books", notice: "You need to be this book's creator to do this."
    elsif current_user and current_user.id = @book.user_id 
      @book.destroy
      redirect_to "/books", notice: "Your book was deleted successfully."
    else
      redirect_to new_login_path, alert: "Please log in first."
    end
  end

  private
  def book_params
    params.require(:book).permit(:user_id, :title, :author, :description, :url)
  end
end
