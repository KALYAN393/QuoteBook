Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  get 'home/index'
  get 'home/show'
  get "post/like/:post_id" => "likes#save_like", as: :like_post

  get '/search',to: "home#search"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "home#index"


  resources :posts
  resources :comments, only: [:create]
  # resources :likes, only: [:index]
end
