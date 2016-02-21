Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:show, :create] do
    resources :likes, only: [:create, :destroy]
  end
  root 'posts#index'
end
