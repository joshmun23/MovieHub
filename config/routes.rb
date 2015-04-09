Rails.application.routes.draw do
  root 'movies#index'
  resources :autocomplete, only: [:index]
  resources :users, only: [:index, :destroy, :update, :edit]
  resources :movies do
    resources :reviews, only: [:create, :update, :destroy]
  resources :searches, only: [:index]
  end
end
