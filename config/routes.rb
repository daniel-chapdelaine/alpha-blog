Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # resources gives you a ton of out-of-the-box methods for Model
  # you can choose to add specific methods using `only`
  # without `only`, all methods will be available in you routes. test with `rails routes --expanded`
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
end
