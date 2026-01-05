Rails.application.routes.draw do


  # ========== DEVise ==========
  devise_for :users, path: '', path_names: {
  sign_in: 'login',
  sign_out: 'logout',
  sign_up: 'register',
  sessions: 'users/sessions'
  }
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  # ========== ADMIN ==========
  namespace :admin do
    root "dashboard#index"
    resources :users
    resources :projects
    resources :tasks
  end

  # ========== PUBLIC ==========
  root "home#index"

  resources :users
  resources :projects
  resources :tasks do
    collection do
      get :by_user
    end
  end

end


