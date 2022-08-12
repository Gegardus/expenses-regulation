Rails.application.routes.draw do
  # get 'transactions/index'
  # get 'transactions/show'
  # get 'transactions/new'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'

  resources :categories
  resources :transactions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'categories#index'
end
