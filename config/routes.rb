Rails.application.routes.draw do


  get '/' => 'sessions#welcome'

  get '/signin' => 'sessions#new', as: 'login'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'


resources :users

resources :rides

resources :attractions


end
