Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users, only: [:new, :create, :show] do
    resources :properties, only: [:index, :new, :create, :show]
    resources :operations, only: [:new, :create, :index]
  end

  resources :sessions, only: [:create]
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
end
