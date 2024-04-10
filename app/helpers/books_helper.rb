module BooksHelper
  def search_books(search_term)
    Book.where('title LIKE ? OR author LIKE ?', "%#{search_term}%", "%#{search_term}%")
  end
end
