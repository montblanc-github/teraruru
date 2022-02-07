Rails.application.routes.draw do

  devise_for :admins
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

end
