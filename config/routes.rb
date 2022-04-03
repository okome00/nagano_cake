Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'homes/top'
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

  # 管理者コントローラーのルーディング / アプリケーション詳細設計書参照
  # genres_controllerのルーディング
  # items_controllerのルーディング
  # customers_controllerのルーディング
  # homes_controllerのルーディング
  # orders_controllerのルーディング
  # order_details_controllerのルーディング
  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

end
