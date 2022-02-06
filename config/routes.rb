Rails.application.routes.draw do

  # ユーザ側ルーティング
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
