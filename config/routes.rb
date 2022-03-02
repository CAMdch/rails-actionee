Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :companies
  get "/profiles", to: "profiles#dashboard", as: :porfile

  resources :companies do
    resources :favorites, only: %i[new create]
  end

  resources :favorites, only: %i[destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
