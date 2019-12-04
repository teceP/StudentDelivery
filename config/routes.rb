# frozen_string_literal: true

Rails.application.routes.draw do
  get '/shop', to: 'pages#shop'
  get '/warenkorb', to: 'pages#warenkorb'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  root to: 'pages#home'
end
