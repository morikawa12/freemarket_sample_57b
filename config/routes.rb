Rails.application.routes.draw do
  resources :comments, only: [:index]
  devise_for :users
  
  root 'items#index'
  resources :items, only: [:index]

end
