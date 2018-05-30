Rails.application.routes.draw do

  resources :owners, only: [:new, :create, :edit, :update, :show] do
    resources :rescues
  end

  resources :pets do
    resources :rescues, only: [:new, :create]
  end

  resources :rescues, only: [:index]

  resources :shelters, only: [:index, :show]

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/logout', to: 'sessions#destroy'

  get '/high-risk', to: 'pets#high_risk', as: 'high_risk'

  get '/auth/facebook/callback' => 'sessions#create'

  root 'static_pages#welcome'

end
