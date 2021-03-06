Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create' 
  get '/dashboard', to: 'dashboard#show'

  namespace :dashboard do 
    get '/repos', to: 'repos#index', as: 'repos'
  end
end
