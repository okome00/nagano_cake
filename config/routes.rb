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

end
