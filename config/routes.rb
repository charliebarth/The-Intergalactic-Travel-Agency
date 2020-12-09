Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :planets, only: [:index, :show]
  resources :visits, only: [:index, :new, :create]
  
  resources :users, only: [:show] do
    resources :visits, only: [:index, :new, :create]
  end
 
  root 'sessions#welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get 'welcome', to: 'sessions#welcome'

end
