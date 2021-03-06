Rails.application.routes.draw do

  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
end

  resources :users, only: [:show, :index, :edit, :update, :destroy]
  root 'books#top'

  get '/home/about' => 'books#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
