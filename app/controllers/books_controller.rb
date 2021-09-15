class BooksController < ApplicationController
  def index
     @books = Book.all
     @new_book = Book.new


  end

  def edit
    @book = Book.find(params[:id])
  end







 def create



    # １@list = List.new(list_params)




    @new_book = Book.new(book_params)
    if @new_book.save
       flash[:notice] = "Book was successfully created."
      redirect_to book_path(@new_book.id)
    else
      flash[:danger] = "2 errors prohibited this book from being saved"
      @books = Book.all

      render :index

    end
 end

 def destroy
      book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
 end

 def show
    @book = Book.find(params[:id])
 end

  def update

   @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book)
   else
      flash[:danger] = "2 errors "

      render :edit
   end
  end



 private

  # ストロングパラメータ

 def book_params
    params.require(:book).permit(:title,:body)
 end





end








