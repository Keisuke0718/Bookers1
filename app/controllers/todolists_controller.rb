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
  	book = Book.new(book_params)
  	book.save
  	redirect_to todolist_path(book.id)
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
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to todolist_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to todolists_path
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
