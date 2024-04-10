require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /' do
    let(:valid_attributes) { attributes_for(:user) }

    context 'with valid parameters' do
      it 'creates a new user' do
        expect {
            post '/users', params: { user: valid_attributes }
          }.to change(User, :count).by(1)
      end

      it 'saves the correct user attributes' do
        post user_registration_path, params: { user: valid_attributes }
        user = User.last

        expect(user.email).to eq(valid_attributes[:email])
        expect(user.name).to eq(valid_attributes[:name])
        expect(user.last_name).to eq(valid_attributes[:last_name])
        expect(user.address).to eq(valid_attributes[:address])
        expect(user.cellphone).to eq(valid_attributes[:cellphone])
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil } }

      it 'does not create a new user' do
        expect {
          post '/users', params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

    end

  end
end
