Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

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
