Rails.application.routes.draw do
  resources :users
  resources :tweets
  resources :profiles
  resources :likes #, only: [:create, :destroy]
  root 'tweets#index'
  
  get 'top/login'
  get 'top/logout'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  post 'users/create'
end
