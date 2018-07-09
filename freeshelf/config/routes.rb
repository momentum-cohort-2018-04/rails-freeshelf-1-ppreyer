Rails.application.routes.draw do
  get 'books/authors'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :checkouts
  resources :users

  resource :login
  get 'login', to: 'logins#new'
  get 'logout', to: 'logins#destroy', as: 'logout'

  root 'books#index'
end
