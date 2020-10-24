Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  root 'hourlogs#new'
  resources :projects
  resources :hourlogs
  resources :filters
  match '/users',   to: 'users#index',   via: 'get'
  resources :users
end
