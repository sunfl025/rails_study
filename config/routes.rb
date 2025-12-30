Rails.application.routes.draw do

  get 'home/index'
  root "home#index"
  devise_for :users

  # get "/users", to: "users#index"
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/users/new", to: "users#new"
  # post "/users", to: "users#create"
  resources :users
  resources :tasks do
    collection do
      get :by_user
    end
  end
  get "/projects", to: "projects#index"
  resources :projects


end


