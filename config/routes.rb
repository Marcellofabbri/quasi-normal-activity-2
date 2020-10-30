Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  
  get '/@:username', to: 'users#show', as: :profile
end
