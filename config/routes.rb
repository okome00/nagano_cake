Rails.application.routes.draw do
  # 管理者コントローラーのルーディング / アプリケーション詳細設計書参照
  # homes_controllerのルート設定
  # genres_controllerのルーディング
  # items_controllerのルーディング
  # customers_controllerのルーディング
  # orders_controllerのルーディング
  # order_details_controllerのルーディング
  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  # 顧客コントローラーのルーディング / アプリケーション詳細設計書参照
  # homes_controllerのルーディング
  # customers_controllerのルーディング
  # items_controllerのルーディング
  # addresses_controllerのルーディング
  # orders_controllerのルーディング
  scope module: 'public' do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers' => 'customers#update'
    patch 'customers/withdraw' => 'customers#withdraw'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :cart_items, only: [:index, :update, :destroy]
  end

  # 顧客用deviseルーディング設定：URL /customers/sign_in,up ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用deviseルーディング設定：URL /customers/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

end
