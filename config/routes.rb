Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :friendships, only: [:create, :update, :destroy]
  resources :films, only: [:index, :show]
  resources :people, only: [:show]
end
