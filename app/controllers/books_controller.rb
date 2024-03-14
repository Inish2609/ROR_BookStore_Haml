class BooksController < ApplicationController
  before_action :reqiure_user
  def index
    @books = Book.all
  end

  def new
      
  end

  def create
    # byebug
    @book = current_user.books.build(params.require(:book).permit(:title,:author_name,:description,:category,:price,:quantity,:image))
    if @book.save
      flash[:success] = "Your Book is Added 🎆"
      redirect_to books_path
    else
      flash.now[:danger] = "SomeThink Went Wrong 🥲"
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    # byebug
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title,:author_name,:description,:category,:price,:quantity,:image))
      flash[:success] = "Updated Successfully 😉!!!"
      redirect_to books_path
    else
      flash.now[:danger] = "SomeThink Went Wrong 🥲"
      render 'edit'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def filter
    @books = Book.where(category: params[:category])
  end

  def search
    # byebug
    @books = Book.where("title LIKE ?","%#{params[:search]}%")
  end

end
