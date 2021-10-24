Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  get '/home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
    resource :favorites, only: [:create, :destroy]
  
  get '/books' => 'books#new', as: 'new_book'
  get '/books' => 'books#show'
  
  resources :users, only: [:show, :index, :edit, :update]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
