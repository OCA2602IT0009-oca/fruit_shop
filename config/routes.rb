# app/config/routes.rb

Rails.application.routes.draw do
  get "mypage/show"

    # ユーザ認証
  devise_for :users

  # マイページ
  resources :mypage, only: [:show]

  # 商品登録
  resources :products

  # トップページ
  root to: "homes#top"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end
