class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
		@books = Book.all
		if @book.save
				flash[:success_notice] = 'You have creatad book successfully.'
			redirect_to book_path(@book.id)
		else
			render 'index'
		end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
		@users = User.all
	end

	def show
		@book = Book.find(params[:id])
		@book_new = Book.new
		@user = @book.user
		@book_comment = BookComment.new
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def correct_user
		@user = User.find(params[:id])
			redirect_to(user_url(current_user)) unless @user == u
	end
	def edit
		@book = Book.find(params[:id])
		if current_user.id != @book.user_id
			redirect_to books_path
		end

	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
				flash[:success_notice] = 'You have updated book successfully.'
			redirect_to book_path(@book.id)
		else
			render 'edit'
		end
	end

	def top
	end

	def about
	end

private
	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end
