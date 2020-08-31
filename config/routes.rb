Rails.application.routes.draw do
  
  devise_for :users
  get 'users', to: redirect('/')

  namespace :admin do
    scope "(:locale)", locale: /pt|es/ do
      resources :videos
      resources :news
      resources :comments, only: [:index, :update, :destroy]
      resources :tags
      resources :users, only: [:index, :update, :destroy]
    end
  end

  scope "(:locale)", locale: /pt|es/ do
    resources :friends, only: [:index, :update, :destroy]
    resources :users, only: [:show, :update]
    resources :videos, only: [:index, :show, :update]
    resources :news, only: [:index, :show, :update]
    root to: "news#index"
  end
end
