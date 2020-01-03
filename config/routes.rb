Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Facebook側で認証情報が挿入されると、再度リダイレクトしてアプリケーションのコールバックメソッドに戻ります。
  # コールバックを実装する場合に最初に必要なのは、config/routes.rbを開いて、Omniauthコールバックを実装するコールバックをDeviseに伝えることです
  
  root 'items#index'

  resources :users, only: [:index, :edit, :show] do  
    collection do
      get 'logout' #次にAPIログインを設置
    end
    member do
      get 'item_management'
      get 'card'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end


  resources :addresses, only: [:edit,:update]
  # get ‘addresses/update’ => ‘addresses#update’

  resources :items do
  collection do
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
    get 'get_size', defaults: { format: 'json' }
    get 'get_shipping', defaults: { format: 'json' }
  end
  member do
    get 'buy'
    get 'get_category_children', defaults: { format: 'json' }
    get 'get_category_grandchildren', defaults: { format: 'json' }
    get 'get_size', defaults: { format: 'json' }
    get 'get_shipping', defaults: { format: 'json' }

    get 'buy', to: 'items#buy'
    get 'detail', to: 'detail'
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

