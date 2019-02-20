Rails.application.routes.draw do
  root 'trips#index'
  resources :trips, param: :slug
  resources :trails, param: :slug

  resources :users, only: [:new, :show, :create], param: :slug


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'
end
