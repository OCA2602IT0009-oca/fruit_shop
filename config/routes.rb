Rails.application.routes.draw do
  get "carts/show"
  get "carts/index"
  get "orders/new"
  get "mypage/show"

  # ユーザーのカート内の商品操作
  resources :cart_items, only: [:create, :update, :destroy]

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

  resources :carts, only: [:show, :index] do
  # セッションカートに商品を追加、数量を更新、商品を削除するアクション
    collection do
      post :add_product  # カートに商品を追加
    end
    member do
      delete :remove_item  # カートから商品を削除
      post :update_quantity  # カート内の商品数を変更
    end
  end
  
end
