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
end
