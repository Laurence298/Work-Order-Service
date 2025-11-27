Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :sign_up

  root "home#index"

  resource :companies
  resources :customers
  resources :services do
    collection do
      get :add_tier
    end
  end
  resources :employees
  resources :requested_services do
    collection do
      get :service_tiers
    end
  end 
  resources :addresses
end
