Rails.application.routes.draw do

  root "contacts#index"
  # get 'contacts/new'
  # get 'contacts/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :contacts, only: [:index, :new, :create]

end
