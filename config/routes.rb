Rails.application.routes.draw do
  root 'movies#index'
  resources :movies, only: [:index, :new,
                            :show, :edit, :update, :destroy, :create]
  devise_for :users
end
