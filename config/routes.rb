# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  get '/shop', to: 'pages#shop'
  get '/warenkorb', to: 'pages#warenkorb'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/profile', to: 'pages#profile'

  root to: 'pages#home'

  devise_for :users

end
