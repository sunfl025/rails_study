Rails.application.routes.draw do
  resources :users
  root 'application#hello'
  get "/users", to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users/new", to: "users#new"
  post "/users", to: "users#create"
end


