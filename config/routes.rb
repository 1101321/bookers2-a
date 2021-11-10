Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  get '/home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get '/books' => 'books#new', as: 'new_book'
  get '/books' => 'books#show'

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
    resources :messages, only: [:create]
    resources :rooms, only: [:create, :show]
  end

  get '/search' => 'searches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
