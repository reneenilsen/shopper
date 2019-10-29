Rails.application.routes.draw do

 resources :categories
  resources :cart_products
  devise_for :users
  resources :products
  resources :carts
  get '/search' => 'products#search', :as => 'search_page'
  
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
