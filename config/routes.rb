Rails.application.routes.draw do
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
end
