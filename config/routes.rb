Troo::Application.routes.draw do
  resources :users
  resources :sessions

  get "login" => "sessions#new", as: "log_in"
  get "logout" => "sessions#destroy", as: "log_out"
  get "signup" => "users#new", as: "sign_up"

  root :to => 'home#index'
end
