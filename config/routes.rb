Rails.application.routes.draw do

  # ユーザ側ルーティング
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    resources :users, only: [:edit, :show]

    # homes
    root "homes#top"
  end

  # 管理者側ルーティング
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

end
