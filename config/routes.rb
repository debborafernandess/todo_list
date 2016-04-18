Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :lists, only: [:new, :create, :index, :edit, :update, :destroy]
end
