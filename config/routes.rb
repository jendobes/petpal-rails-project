Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :owners do
    resources :rescues
  end

  resources :rescues, only: [:show, :index]

  resources :pets

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/logout', to: 'sessions#destroy'

  get '/high-risk', to: 'pets#high_risk', as: 'high_risk'

  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#welcome'

end
