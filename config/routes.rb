Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/posts/new', to: 'posts#new', as: :new_post

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      post "login" => "users#login"
      get "users" => "users#index"
      get "user/posts" => "posts#index"
      get "post/comments" => "comments#index"
      get "post/comments/create" => "comments#create"
    end
  end

end
