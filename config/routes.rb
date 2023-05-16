Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :chats
  resources :users

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/register', to: 'sessions#register'
end
