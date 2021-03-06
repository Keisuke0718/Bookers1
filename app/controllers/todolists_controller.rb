class TodolistsController < ApplicationController
  def top
  end

  def start
    redirect_to todolists_path
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@books = Book.all
  	 if @book.save
  	 	flash[:notice] = "Book was successfully created."
  	    redirect_to todolist_path(@book.id)
  	 else
  	 	render "index"
  	 end
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
    if @book.update(book_params)
  	 	flash[:notice] = "Book was successfully updated."
  	    redirect_to todolist_path(book.id)
  	else
  		render "edit"
  	end
  end

  def destroy
  	@book = Book.find(params[:id])
    book = Book.find(params[:id])
    if @book.destroy
    	flash[:notice] = "Book was successfully destroyed."
        redirect_to todolists_path
    end
  end

  def back
  	book = Book.find(params[:id])
  	redirect_to todolists_path
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
