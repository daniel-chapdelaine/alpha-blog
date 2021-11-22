Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources gives you all restfull routes for a specific resource
  # you can choose to expose specific methods using `only`
  # without `only`, all methods will be exposed in you routes. test with `rails routes --expanded`
  resources :articles
  #all RESTfull routes only: [:show, :index, :new, :create, :edit, :update, :destroy]
end
