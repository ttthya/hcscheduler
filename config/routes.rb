Rails.application.routes.draw do
root to: 'schedules#index'

resources :schedules
end
