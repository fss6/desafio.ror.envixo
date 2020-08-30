Rails.application.routes.draw do
  
  devise_for :users

  namespace :admin do
    scope "(:locale)", locale: /pt|es/ do
      resources :videos
      resources :news
      resources :comments, only: [:index, :update, :destroy]
      resources :tags
    end
  end

  scope "(:locale)", locale: /pt|es/ do
    resources :videos, only: [:index, :show, :update]
    resources :news, only: [:index, :show, :update]
    root to: "news#index"
  end
end
