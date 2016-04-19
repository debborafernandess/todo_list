Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :lists, only: [:new, :create, :index, :edit, :update, :destroy] do
    resources :tasks, only: [:new, :create]
  end
end
