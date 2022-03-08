Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :companies
  get "/profiles", to: "profiles#dashboard", as: :profile

  resources :companies do
    resources :favorites, only: %i[new create]
    resources :reviews, only: %i[new create]
  end

  resources :review do
    resources :likes, only: %i[new create update]
  end

  resources :track_items
  patch "/track_items/:id/dismiss", to: "track_items#dismiss", as: :dismiss
  patch "/track_items/:id/reset", to: "track_items#reset", as: :reset
  resources :favorites, only: %i[destroy update]
  resources :reviews, only: %i[destroy]
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
