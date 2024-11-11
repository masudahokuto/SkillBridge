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
        delete 'destroy_qualification/:qualification_id', to: 'users#destroy_qualification', as: 'destroy_qualification'
      end
    end

    resources :user_details, only: %i[new create edit]

    resources :portfolios do
      member do
        patch :toggle_visibility
      end
      resources :favorites, only: %i[create destroy]
    end

    resources :skill_tags, only: %i[index create]
  end
  get 'searches', to: 'searches#search'
end
