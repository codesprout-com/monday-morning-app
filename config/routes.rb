Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :rooms, only: [ :show ]

  resource :profile, only: [ :edit, :update ]

  namespace :admin do
    resources :users, only: [ :index, :show ]
    resources :skills, except: [ :destroy ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
