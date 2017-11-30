Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  namespace :admin do
    resources :posts
  end
  

  root "welcome#index"

end
