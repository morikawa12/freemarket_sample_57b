Rails.application.routes.draw do
  resources :comments, only: [:index]
  devise_for :users
  root 'items#index'


  resources :items, only: [:index, :new, :create, :buy] do
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
    get 'buy', to: 'items#buy'
  end
end

end
