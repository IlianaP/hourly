Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  root 'users#current_user_home'
  resources :projects
  resources :hourlogs
  resources :filters
  match '/users',   to: 'users#index',   via: 'get'
  resources :users
end
