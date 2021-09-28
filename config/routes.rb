Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: "confirmations"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :galleries
  root 'static_pages#home' 
  get '/home', to: 'static_pages#home' 
  get '/gallery', to: 'galleries#gallery'
  get '/users/show',to: 'users#show'
  resources :users, only: [:show]
end
