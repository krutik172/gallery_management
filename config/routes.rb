Rails.application.routes.draw do

 
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    confirmations: "confirmations"
  }
  resources :users, only: [:index,:show]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :galleries 
  root 'static_pages#home' 
  get '/home', to: 'static_pages#home' 
  get '/gallery', to: 'galleries#gallery'
  get '/users/show',to: 'users#show'
  
  # get '/search', to: 'gallery_search#new_search', as:'new_search'
  post '/search_galleries', to: 'gallery_search#search_galleries', as:'search_galleries'
  get '/search_box', to: 'search#search_box', as:'search_box'
  post '/showgalleries', to: 'search#showgalleries', as:'showgalleries'
end
