Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  get "requested_service/index"
  root "home#index"

  resources :customers
  resources :services
  resources :requested_services
  resources :addresses
end
