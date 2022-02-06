Rails.application.routes.draw do

  # ユーザ側ルーティング
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  resources :users, only: [:edit, :show]

end
