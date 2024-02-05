Rails.application.routes.draw do
  get 'ratings/index'
  get 'ratings/show'
  get 'ratings/new'
  get 'ratings/create'
  get 'ratings/edit'
  get 'ratings/update'
  get 'ratings/destroy'
  get 'suppliers/index'
  get 'suppliers/show'
  get 'suppliers/new'
  get 'suppliers/create'
  get 'suppliers/edit'
  get 'suppliers/update'
  get 'suppliers/destroy'
  get 'materials/index'
  get 'materials/show'
  get 'materials/new'
  get 'materials/create'
  get 'materials/edit'
  get 'materials/update'
  get 'materials/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
end
