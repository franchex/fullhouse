Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show] do
    resources :assignments, only: [:new, :create]
    resources :spaces, only: [:show ,:new, :create, :index]
  end

  resources :spaces, except: [:show ,:new, :create, :index] do
    resources :tasks
    resources :chores, only: [:new, :create, :index]
    resources :expenses
    resources :bills, only: [:new, :create, :index, :destroy]
    resources :shopping_lists
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
