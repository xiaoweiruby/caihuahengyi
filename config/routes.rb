Rails.application.routes.draw do
  devise_for :users
  resources :cart_items, :qas, :employments

  resources :carts do
     collection do
       delete :clean
       post :checkout
     end
  end
  resources :posts do
    resources :postlists
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
  resources :orders do
     member do
       post :pay_with_alipay
       post :pay_with_wechat
     end
  end


  root "welcome#index"

end
