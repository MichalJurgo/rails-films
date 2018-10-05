# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :friendships, only: %i[create update destroy]
  resources :films, only: %i[index show] do
    resources :reviews, only: %i[index show new create]
  end
  resources :people, only: [:show]
  resources :news
  resources :libraries
  resources :users, only: %i[index show]

  mount ActionCable.server => '/cable'
end
