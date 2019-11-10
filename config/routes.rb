Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
  
  root 'items#index'
  resources :items, only: [:index]

end
