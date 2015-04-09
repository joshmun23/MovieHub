Rails.application.routes.draw do
  devise_for :users
  root 'movies#index'
  resources :autocomplete, only: [:index]
  resources :users, only: [:index, :destroy, :update, :edit]

  resources :movies do
    resources :reviews, only: [:create, :update, :destroy]
  end

  resources :searches, only: [:index]
end
