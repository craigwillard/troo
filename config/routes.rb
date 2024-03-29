Troo::Application.routes.draw do
  resources :tags

  resources :interviews

  resources :social_media_sites
  resources :social_media_accounts, except: [:new, :create]

  resources :users do
    resources :social_media_accounts
    resources :interviews
  end

  resources :sessions

  get "login" => "sessions#new", as: "log_in"
  get "logout" => "sessions#destroy", as: "log_out"
  get "signup" => "users#new", as: "sign_up"

  root :to => 'home#index'
end
