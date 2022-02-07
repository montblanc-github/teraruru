Rails.application.routes.draw do

  namespace :public do
    get 'articles/index'
    get 'articles/show'
    get 'articles/new'
    get 'articles/edit'
  end
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
