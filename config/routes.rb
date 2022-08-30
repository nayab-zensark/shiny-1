Rails.application.routes.draw do
  
  get 'home/index'
  devise_for :users

  resources :aadhar_cards

  resources :pan_cards

  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
 
end
