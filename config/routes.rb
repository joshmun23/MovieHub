Rails.application.routes.draw do
  root 'movies#index'

  devise_for :users
  resources :autocomplete, only: [:index]
  resources :movies, only: [:index, :new, :show, :edit, :create, :update, :destroy] do
    resources :reviews, only: [:create, :update, :destroy]
  end
end
