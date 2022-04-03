Rails.application.routes.draw do
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
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
