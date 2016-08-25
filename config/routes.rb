Rails.application.routes.draw do
  get '/' => 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'


# resources :sessions

resources :users

resources :rides

resources :attractions


end
