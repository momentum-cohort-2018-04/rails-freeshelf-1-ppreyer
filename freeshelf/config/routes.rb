Rails.application.routes.draw do
  get 'books/authors'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :checkouts
end
