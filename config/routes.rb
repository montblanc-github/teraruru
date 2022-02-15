Rails.application.routes.draw do
  # ユーザ側ルーティング
  devise_for :users, skip: [:registrations], controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
  }

  devise_scope :user do
    get "users/cancel", to: "public/registrations#cancel", as: :cancel_user_registration
    get "users/sign_up", to: "public/registrations#new", as: :new_user_registration
    resource :users, only: [:create], as: "user_registration", controller: "public/registrations"
  end

  scope module: :public do
    # users
    resources :users, only: [:show, :edit, :update, :destroy] do
      member do
        get "unsubscribe"
      end

      resource :relationships, only: [:create, :destroy]
      get "followings", to: "relationships#followings", as: "followings"
      get "followers", to: "relationships#followers", as: "followers"
    end

    resources :chats, only: [:show, :create]

    # homes
    root "homes#top"
    get "/about", to: "homes#about"

    # articles
    resources :articles do
      collection do
        get "get_municipalities"
        get "get_municipalities_search"
        get "search"
      end

      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  # 管理者側ルーティング
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]

    resources :articles, only: [:show, :update, :destroy]
  end
end
