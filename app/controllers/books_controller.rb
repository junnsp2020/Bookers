class BooksController < ApplicationController

  def index
  	@books=Book.all
  	@book=Book.new
  end

  def show
  	@book=Book.find(params[:id])
  end

  def new
  	# viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
  	@book=Book.new
  end

  def create
  	#ストロングパラメータを使用
  	@book=Book.new(book_params)
  	#DBへ保存する
  	#トップ画面へリダイレクト
  	if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books=Book.all
      render :index
    end
  end

  def destroy
  	book=Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  def back
  	@book=Book.find(params[:id])
  	redirect_to "http://localhost:3000/books"
  end

  def edit
  	@book=Book.find(params[:id])
  end

  def update
  	book=Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id), notice: "Book was successfully updated."
end

private
def book_params
	params.require(:book).permit(:title, :body)
end
end