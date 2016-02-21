Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:show, :create]
  root 'posts#index'
end
