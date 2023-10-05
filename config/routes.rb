Rails.application.routes.draw do

  # 管理者用のDevise設定
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用のDevise設定
  devise_for :enduser, controllers: {
    registrations: "enduser/registrations",
    sessions: 'enduser/sessions'
  }
  devise_scope :enduser do
  post 'users/guest_sign_in', to: 'enduser/sessions#guest_sign_in'
  end
  
  scope module: :enduser do
    root to: 'homes#top' # ルートパスを設定
    
    resources :favorite, only: [:create, :destroy]
    get 'users/confirm_withdrawal'
    patch 'users/withdrawal'
    get 'users/participant'
    resources :posts do
      resources :participants
    end
    resources :calendars
    resources :users do
      member do
        get 'favorite_users', to: 'users#favorite_users'
      end
    end
  end
  
  namespace :admin do
    root to: 'homes#top'
    get "" => "homes#top"
    resources :posts, only: [:show, :edit, :update, :new, :create] 
    resources :tags#, only: [:index, :create, :edit, :update] 
    resources :endusers, only: [:index, :show, :edit, :update] 
  end

end
