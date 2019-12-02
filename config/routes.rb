Rails.application.routes.draw do
  get 'profile/profile'
  get '/shop', to: 'pages#shop'
  get '/warenkorb', to: 'pages#warenkorb'
  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'


  #get 'pages/home'
  #  get 'home/index'
  root to: 'pages#home'
  devise_for :users
end
