Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'user/loans', to: 'loans#index', as: 'user_loans'

  resources :books do
    post 'reserve', on: :member
  end
  # Defines the root path route ("/")
  root "books#index"
end
