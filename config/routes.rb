Rails.application.routes.draw do
  get 'p/:id', to: 'profile#show'
  devise_for :users
  
  post 'profile/follow', to: 'profile#follow'
  delete 'profile/unfollow', to: 'profile#unfollow'
  
  resources :posts
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
