Rails.application.routes.draw do
  root 'movies#index'

  devise_for :users

  resources :users, only: [:index, :destroy, :update]

  resources :movies do
    resources :reviews
  end
end
