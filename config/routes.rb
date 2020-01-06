# frozen_string_literal: true

Rails.application.routes.draw do
  resources :line_items, except: %i[edit show]
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
