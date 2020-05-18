Rails.application.routes.draw do
  devise_for :users

  root to: 'top#index'
  resources :users
  resource :sessions, only: [:new, :create, :destroy, :update]

  resources :players do
    member do #プレイヤーの一覧画面からお気に入り登録をする
      post "add", to: "favorites#create"
    end
  end
  resources :favorites, only: [:destroy]



  resources :brands do
    member do
      post "add", to: "brand_users#create"
    end
  end
  resources :brand_users, only: [:destroy]

end
