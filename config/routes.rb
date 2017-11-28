Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  namespace :admin do
    resources :posts
  end
  namespace :vip do
    resources :products
  end

  root "welcome#index"

end
