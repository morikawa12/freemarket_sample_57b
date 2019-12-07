Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:show]

  resources :items, only: [:index, :new, :create, :edit, :update] do
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
    get 'get_size', defaults: { format: 'json' }
    get 'get_shipping', defaults: { format: 'json' }
  end
  member do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
    get 'get_size', defaults: { format: 'json' }
    get 'get_shipping', defaults: { format: 'json' }
  end
end

  resources :signup do 
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' 
      get 'done'
    end
  end
end

