Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Facebook側で認証情報が挿入されると、再度リダイレクトしてアプリケーションのコールバックメソッドに戻ります。
  # コールバックを実装する場合に最初に必要なのは、config/routes.rbを開いて、Omniauthコールバックを実装するコールバックをDeviseに伝えることです
  
  root 'items#index'
  resources :items, only: [:index]

end
