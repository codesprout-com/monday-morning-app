Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resource :profile, only: [ :edit, :update ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
