# config/routes.rb
Rails.application.routes.draw do
  resources :registrations, only: [:create]
  # resources :sessions, only: [:create]
  post "/login", to: "sessions#login"

  resources :contacts
  resources :interactions

end
