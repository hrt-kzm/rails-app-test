class BooksController < ApplicationController
  def new
    @book = Book.new #モデルオブジェクトを作成し、インスタンス変数listに代入
  end

  def index
    @books = Book.all #投稿されているbooksテーブルのデータを全て取得し、インスタンス変数booksに代入
  end

  def edit
  end

  def show
    @book = Book.find(params[:id]) #booksテーブルから指定したidのデータを取得し、インスタンス変数bookに代入する
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to 'books'
  end
  private

  def book_params
    params.permit(:title, :body)
  end
end