Rails.application.routes.draw do
  get 'bookings/new'
  resources :flights, only: [:index]
  resources :bookings, only: [:new, :create]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
end
