Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  get '/homes/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :destroy]
  get '/books' => 'books#new', as: 'new_book'
  
  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
