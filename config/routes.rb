Rails.application.routes.draw do

  resources :price

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
    Rails.application.routes.draw do
     mount Sidekiq::Web => '/sidekiq'
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "price#index"

   
end
