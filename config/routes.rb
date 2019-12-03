Rails.application.routes.draw do
  get 'profile/profile'
  get '/shop', to: 'pages#shop'
  get '/warenkorb', to: 'pages#warenkorb'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'

  root 'pages#home'
  devise_for :users
end
