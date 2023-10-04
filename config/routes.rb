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

  scope module: :enduser do
    root to: 'homes#top' # ルートパスを設定
    resources :favorite, only: [:create, :destroy]
    get 'users/confirm_withdrawal'
    patch 'users/withdrawal'
    get 'users/favorite'
    get 'users/participant'
    resources :users, only: [:show, :edit, :update] # 複数形に修正
    resources :participants, only: [:show, :index] # 複数形に修正
    resources :posts, only: [:show, :index] # 複数形に修正
    resources :calendars
  end
  
  namespace :admin do
    get "" => "homes#top"
    resources :posts, only: [:show, :edit, :update] # 複数形に修正
    resources :tags, only: [:index, :create, :edit, :update] # 複数形に修正
    resources :endusers, only: [:index, :show, :edit, :update] # 複数形に修正
  end

end
