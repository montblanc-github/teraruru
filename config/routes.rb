Rails.application.routes.draw do

  get 'users/public'
  # ユーザ側ルーティング
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    resources :users, only: [:edit, :show]
  end

end
