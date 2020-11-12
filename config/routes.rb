Rails.application.routes.draw do
  get 'users/index'
  get 'topics/new'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  get '/comments/:topic_id/new', to: 'comments#new', as: 'comments'
  post '/comments/:topic_id/create', to: 'comments#create', as: 'comments_create'
  
  get 'stamps/index'
  post '/stamps', to: 'stamps#create'
  delete '/stamps', to: 'stamps#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :topics
  resources :relationships, only: [:create, :destroy]
end