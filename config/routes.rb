# frozen_string_literal: true

Rails.application.routes.draw do
  get 'adminpanel/admin'
  get 'chat/index'
  resources :messages, only: %i[new create]
  resources :posts
  resources :line_items, only: %i[create update destroy]
  resources :carts, only: %i[index show update destroy]
  resources :products, except: %i[show]
  get 'store/index'
  get 'users/index'
  get '/shop', to: 'products#index'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/profile', to: 'pages#profile'

  root to: 'pages#home'

  devise_for :users

end
