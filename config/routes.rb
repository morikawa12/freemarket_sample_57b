Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Facebook側で認証情報が挿入されると、再度リダイレクトしてアプリケーションのコールバックメソッドに戻ります。
  # コールバックを実装する場合に最初に必要なのは、config/routes.rbを開いて、Omniauthコールバックを実装するコールバックをDeviseに伝えることです
  
  root 'items#index'

  resources :users, only: [:show] do
    collection do
      get 'logout' #次にAPIログインを設置
    end
  end

  resources :users, only: [:index, :edit, :show]




  resources :items, only: [:index, :new, :create, :edit, :update, :show] do
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

