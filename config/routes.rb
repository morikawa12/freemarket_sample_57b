Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'comments#index' 
  get 'comments/index' 
end
