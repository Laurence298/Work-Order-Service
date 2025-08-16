Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :sign_up

  root "home#index"

  resource :companies
  resources :customers


  resources :services do
   resources :service_details, only: [ :new, :create ]
  end
  resources :requested_services do
    member do
      patch :complete_task
    end
  end
  resources :addresses
end
