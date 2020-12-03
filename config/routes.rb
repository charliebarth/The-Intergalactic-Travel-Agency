Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :planets, only: [:index, :show]
  resources :visits, only: [:index, :show]
  
  resources :users, only: [:show] do
    resources :visits
  end
 
  root 'users#create'
end
