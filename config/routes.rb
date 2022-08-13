Rails.application.routes.draw do
  # get 'splash/index'
  # get 'transactions/index'
  # get 'transactions/show'
  # get 'transactions/new'
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new

  devise_for :users
  resources :categories
  resources :transactions

  unauthenticated do
    root "splash#index"
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
end
