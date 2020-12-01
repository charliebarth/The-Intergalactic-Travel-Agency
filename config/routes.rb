Rails.application.routes.draw do
  resources :planets only: [:index, :show]
  resources :visits only: [:index, :show]
  resources :users
  
  resources :users, only: [:show] do
    resources :visits
  end
 
  root 'users#create'
end
