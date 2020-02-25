Rails.application.routes.draw do
  root 'doctors#index'

  resources :users
  resources :doctors do
  resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
