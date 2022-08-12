Rails.application.routes.draw do
  # get 'transactions/index'
  # get 'transactions/show'
  # get 'transactions/new'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new

  devise_for :users
  resources :categories
  resources :transactions

  root 'categories#index' 
end
