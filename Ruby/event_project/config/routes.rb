Rails.application.routes.draw do

  get 'events/index' => 'events#index'
  post 'events' => 'events#create'

  root 'users#new'

  get 'users/new' =>  'users#new'

  post 'users' => 'users#create'

  post 'sessions' => 'sessions#create'

  delete '/sessions' => 'sessions#destroy'
  
end
