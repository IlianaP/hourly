Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  root 'users#current_user_home'
  get 'status', to: 'static_pages#status'
  resources :projects
  resources :hourlogs
  resources :filters
  match '/users',   to: 'users#index',   via: 'get'
  resources :users
end
