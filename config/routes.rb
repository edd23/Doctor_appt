Rails.application.routes.draw do
  root 'courses#index'

  resources :users
  resources :courses do
  resources :appointments, only: [:index, :new, :create, :destroy]
  end
end
