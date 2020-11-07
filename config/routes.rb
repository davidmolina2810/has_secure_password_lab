Rails.application.routes.draw do
  get 'users/new', to: 'users#new'

  post 'users/create', to: 'users#create'

  post '/login', to: 'sessions#create', as: :login_path

  get '/login', to: 'sessions#new'

  get '/users/home', to: 'users#home'

  post '/logout', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
