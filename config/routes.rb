Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show] do
    resources :assignments, only: [:new, :create]
  end

  resources :spaces do
    resources :tasks
    resources :chores
    resources :expenses
    resources :bills, only: [:new, :create]
    resources :shopping_lists
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
