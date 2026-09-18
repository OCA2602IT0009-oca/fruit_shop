# app/config/routes.rb

Rails.application.routes.draw do
  get "orders/new"
  get "mypage/show"

    # ユーザ認証
  devise_for :users

  # マイページ
  resources :mypage, only: [:show]

  # 商品登録
  resources :products

  # 注文入力・注文作成
  resources :orders, only: [:index, :new, :create] do 
   collection do
     post :confirm   # 注文確認
   end

      member do
     get :complete  # 注文完了
   end
 end

  # トップページ
  root to: "homes#top"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
end
