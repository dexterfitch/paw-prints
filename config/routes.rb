Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users do
    resources :prints, only: [:new, :create]
  end
  resources :sessions, only: [:new, :create, :destroy]
end
