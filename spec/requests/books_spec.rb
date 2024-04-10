require 'rails_helper'

RSpec.describe 'Books', type: :request do
  context 'GET /' do
    describe 'index' do
      it 'returns http success' do
        get '/books'
        expect(response).to have_http_status(200)
      end
    end

    describe 'new' do
      it 'returns http success' do
        get '/books/new'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'show' do
      let(:book) { create(:book) }

      it 'returns http success' do
        get "/books/#{book.id}"
        expect(response).to have_http_status(:success)
      end
    end

    describe 'edit' do
      let(:book) { create(:book) }

      it 'returns http success' do
        get "/books/#{book.id}/edit"
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /' do
    let(:valid_attributes) { attributes_for(:book) }

    context 'with valid parameters' do
      it 'creates a new book' do
        expect {
            post '/books', params: { book: valid_attributes }
          }.to change(Book, :count).by(1)
      end

      it 'redirects to the created book' do
        post '/books', params: { book: valid_attributes }
        expect(response).to redirect_to(Book.last)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { title: nil } }

      it 'does not create a new book' do
        expect {
          post '/books', params: { book: invalid_attributes }
        }.to change(Book, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post '/books', params: { book: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end

  end

  describe 'UPDATE /' do
    context 'with valid parameters' do
      let(:valid_attributes) { attributes_for(:book) }
      let(:book) { create(:book) }

      it 'update the book' do
        patch "/books/#{book.id}", params: { book: valid_attributes }
        book = Book.last

        expect(book.title).to eq(valid_attributes[:title])
        expect(book.author).to eq(valid_attributes[:author])
        expect(book.publication_year).to eq(valid_attributes[:publication_year].to_i)
        expect(book.state).to eq(valid_attributes[:state])
        expect(book.isbn).to eq(valid_attributes[:isbn].to_s)
      end

      it 'redirects to the created book' do
        patch "/books/#{book.id}", params: { book: valid_attributes }

        expect(response).to redirect_to(Book.last)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { title: '', author: '', publication_year: '', state: '', isbn: '' } }
      let(:book) { create(:book) }

      it 'does not update the book' do
        patch "/books/#{book.id}", params: { book: invalid_attributes }
        book.reload

        expect(book.title).not_to eq(invalid_attributes[:title])
        expect(book.author).not_to eq(invalid_attributes[:author])
        expect(book.publication_year).not_to eq(invalid_attributes[:publication_year])
        expect(book.state).not_to eq(invalid_attributes[:state])
        expect(book.isbn).not_to eq(invalid_attributes[:isbn])
      end

      it 're-renders the edit form' do
        patch "/books/#{book.id}", params: { book: invalid_attributes }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /' do
    it 'delete a book' do
      book = create(:book)

      expect {
        delete "/books/#{book.id}"
      }.to change(Book, :count).by(-1)
      expect(response).to have_http_status(:found)
    end
  end
end
