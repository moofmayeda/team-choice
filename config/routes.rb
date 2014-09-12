Rails.application.routes.draw do
  devise_for :users
  root to: "pins#index"
  resources :users, only: [:show, :index, :edit]
  resources :pins
  resources :api_keys, only: [:create]
end
