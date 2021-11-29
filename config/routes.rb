Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources gives you all restfull routes for a specific resource
  # you can choose to expose specific methods using `only`
  # without `only`, all methods will be exposed in you routes. test with `rails routes --expanded`
  resources :articles
  #all RESTfull routes only: [:show, :index, :new, :create, :edit, :update, :destroy]

  # this shows how to exclude routes from resources if it is not needed or that it can be defined differently 
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
