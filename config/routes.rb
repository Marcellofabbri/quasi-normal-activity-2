Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  
  get '/:handle', to: 'users#show', as: :profile
  get '/:current_user_handle', to: 'users#show', as: :current_user_profile
  resources :categories
  get '/categories/new', to: 'categories#new', as: :add_category
  get '/categories/delete', to: 'categories#delete', as: :delete_category
  get '/categories/edit', to: 'categories#edit', as: :modify_category
  resources :stories
end
