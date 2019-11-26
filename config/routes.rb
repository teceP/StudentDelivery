Rails.application.routes.draw do
  get 'profile/profile'
  #get 'pages/home'
#  get 'home/index'
  root to: 'pages#home'
  devise_for :users
end
