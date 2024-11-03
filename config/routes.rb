Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :companies,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    resources :users, except: %i[new create] do
      collection do
        get 'mypage', to: 'users#mypage'
        patch 'withdraw'  # 退会処理
      end
    end

    resources :user_details, only: %i[new create edit]

    resources :portfolios

    resources :skill_tags, only: %i[index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
