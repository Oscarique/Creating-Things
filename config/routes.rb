Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cases, only: [:create, :new]
  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resources :cases, only: [:index, :update, :destroy]
  end
end
