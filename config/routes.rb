Rails.application.routes.draw do
  devise_for :users
  
  root 'items#index'
  resources :items, only: [:index, :new]

  get "signup", to: "signup#index"
  resources :signup do
  collection do
    get 'step1'
    post 'step2'
    post 'step3'  
    post 'step4'
    post 'done' 
   end
 end
end

