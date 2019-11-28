class BooksController < ApplicationController
    before_action :authenticate_user!
    def top
    end

    def index
       @user = current_user
       @books = Book.all
       @book = Book.new
    end

    def new
      @book = Book.new
      @books = Book.all
    end

    def show
        @user = current_user
        @book = Book.new
        @books = Book.find(params[:id])
        flash[:show] = 'You have creatad book successfully.'

    end


    def create
        @books = Book.all
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
           flash[:notice] = "You have creatad book successfully."
        redirect_to book_path(@book.id)
        else
        render 'index'
        end

    end

    def update
    	@book = Book.find(params[:id])
    	if @book.update(book_params)
        flash[:edit] = "You have updated book successfully."
    	redirect_to book_path(@book.id)
        else
        render 'edit'
        end

    end


    def edit
        @user = current_user
    	@book = Book.find(params[:id])
    	flash[:success] = 'Book was successfully updated.'
        if @user != @book.user
         redirect_to books_path
        end

    end

    def destroy
        book = Book.find(params[:id])
        if book.destroy
        flash[:destroy] = "Book was successfully destroyed."
        redirect_to books_path
        end
    end

    private

    def book_params
    params.require(:book).permit(:title, :body)
    end

    end
