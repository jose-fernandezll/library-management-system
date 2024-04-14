# frozen_string_literal: true

# Controller Books
class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit update destroy reserve]
  def index
    return @books = search_books(params[:search]) if params[:search]

    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    return redirect_to @book if @book.save

    render 'new'
  end

  def update
    return redirect_to @book if @book.update(book_params)

    render 'edit'
  end

  def destroy
    @book.destroy

    redirect_to book_path
  end

  def reserve
    return redirect_to @book, notice: 'Este Libro ya fue Reservado Por Otra Persona' if @book.state.eql?('Reservado')

    @loan = Loan.new(user: current_user, book: @book, start_date: Date.today, end_date: Date.today + 1.week)

    return redirect_to @book, notice: 'No se pudo reservar el libro.' unless @loan.save

    @book.update(state: 'Reservado')
    redirect_to @book, notice: 'Libro reservado con éxito.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publication_year, :state, :isbn)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
