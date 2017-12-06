Rails.application.routes.draw do
  devise_for :users
  resources :cart_items
  resources :carts do
     collection do
       delete :clean
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


  root "welcome#index"

end
