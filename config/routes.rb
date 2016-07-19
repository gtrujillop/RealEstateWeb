Rails.application.routes.draw do

  root 'static_pages#home'
  resources :users, only: [:new, :create, :show] do
    resources :properties do
      resources :property_elements, only: [:index, :new, :create, :show]
    end
    resources :operations, only: [:new, :create, :index]
  end
  resources :sessions, only: [:create]
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
  resources :locations, only: [:new]
  match '/locations/import', to: 'locations#import', via: :post
  #handles properties for non registered users
  #TODO remove default properties resources
  match '/properties/show_all', to: 'properties#show_all', via: :get
  resources :properties do
    match 'visit', via: :get
    match '/property_elements/show_all', via: :get
  end
end
