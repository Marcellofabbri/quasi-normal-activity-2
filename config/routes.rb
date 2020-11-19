Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  
  get '/:handle', to: 'users#show', as: :profile
  get '/:current_user_handle', to: 'users#show', as: :current_user_profile
  resources :categories
  get '/@username/categories/new', to: 'categories#new'
end
