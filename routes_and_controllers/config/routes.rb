Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :create, :show, :update, :destroy]

  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/:id', to: 'users#show'
  # patch '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :artworks, only: [:index, :create, :show, :update, :destroy]
end
