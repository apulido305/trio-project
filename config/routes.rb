Rails.application.routes.draw do

  root 'products#index'

  get '/signup' => 'users#new'
  resources :users, except: [:new]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/users' => 'users#create'

  resources :reviews
  resources :products
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
