class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:complete] = 'Book was successfully destroyed.'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
      flash[:complete] = 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:complete] = 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def update_params
    params.require(:book).permit(:title, :body)
  end

end