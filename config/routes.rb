Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :owners
  resources :pets

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#welcome'

end
