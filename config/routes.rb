Rails.application.routes.draw do
  resources :construction_systems
  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :materials
  resources :materials do
    resources :ratings, only: [:create]
  end
  resources :suppliers
  root 'materials#index'
  resources :upvotes, only: [:create, :destroy]
  post '/toggle_vote', to: 'upvotes#toggle_vote'
end
