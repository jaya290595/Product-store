Rails.application.routes.draw do
  devise_for :users
  resources :products do
  	resources :reviews
  end
  resources :carts
  
  root 'products#index'
  
end
