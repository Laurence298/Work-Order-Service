Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :sign_up

  root "home#index"

  resource :companies
  resources :customers
  resources :services
  resources :requested_services 
  resources :addresses
end
