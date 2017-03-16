Rails.application.routes.draw do


  root 'application#home'

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'

  post 'rides/new', to: 'rides#new'

  resources :attractions
  resources :users

end