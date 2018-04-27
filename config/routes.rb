Rails.application.routes.draw do
  root 'leagues#index'

  resources :leagues
end
