Rails.application.routes.draw do
  root 'movies#index'
  devise_for :users
  resources :autocomplete, only: [:index]
  resources :movies do
    resources :reviews, only: [:create, :update, :destroy]
  resources :searches, only: [:index]
  end
end
