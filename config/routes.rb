Rails.application.routes.draw do
  devise_for :users
  resources :cart_items, :orders

  resources :carts do
     collection do
       delete :clean
       post :checkout
     end
  end
  resources :posts do
    resources :comments
    member do
       post :add_to_cart
    end
  end
  namespace :admin do
    resources :posts
  end
  namespace :account do
    resources :orders
  end


  root "welcome#index"

end
