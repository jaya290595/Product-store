Rails.application.routes.draw do
  devise_for :users
  resources :products do
  	resources :reviews
  	resources :notifies
  end
  
  resources :carts
  
  root 'products#index'
  
end
