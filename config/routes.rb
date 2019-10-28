Rails.application.routes.draw do
  resources :labels
  get 'sessions/new'
  resources :users
  resources :tasks
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :sessions
  namespace :admin do
    resources :users
  end
end
