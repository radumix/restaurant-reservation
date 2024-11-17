# Rails.application.routes.draw do
#   devise_for :users

#   resources :reservations, only: [:index, :new, :create, :show, :destroy]

#   namespace :admin do
#     resources :reservations, only: [:index, :update, :edit, :show, :destroy]
#     resources :time_slots, only: [:index, :new, :create, :edit, :update, :destroy]
#   end

#   root "reservations#index"
# end

Rails.application.routes.draw do
  devise_for :users
  resources :reservations, only: [:index, :new, :create, :show, :destroy]

  namespace :admin do
    resources :reservations, only: [:index, :update]
    resources :time_slots
  end
  get "dashboard", to: "admin/reservations#index"
  root "reservations#index"
end
