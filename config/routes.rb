Rails.application.routes.draw do
  get 'google_auths/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/redirect', to: 'google_auths#redirect', as: 'redirect'
  get '/callback', to: 'google_auths#callback', as: 'callback' 
  get '/calendars', to: 'google_auths#calendars', as: 'calendars'

  namespace :admin do
   resources :users
   resources :uploader
  end

  root to: 'schedules#index'

  resources :schedules do
   collection do
    post 'confirm'
   end
  end

end
