Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/awards', to: 'awards#index'

  resources :users, only: [:new, :show, :index, :create]
  resources :movies, only: [:index]

  resources :directors, shallow: true do
    resources :movies, param: :slug
  end

  resources :actors, only: [:new, :create, :index]
  resources :awards

  namespace :admin do
    resources :categories, only: [:index]
    resources :awards, only: [:create]
  end

  resources :carts, only: [:create]
end
