Rails.application.routes.draw do
  # devise_for :users
  resources :reservations, only: [:index, :new, :create, :show, :destroy]

  namespace :admin do
    resources :reservations, only: [:index, :update]
    resources :time_slots
  end

  get "login", to: "reservations#login"
  get "dashboard", to: "admin/reservations#index"
  root "reservations#login"
end
