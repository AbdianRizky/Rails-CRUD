Rails.application.routes.draw do
  devise_for :users
  resources :friends
  root to: 'friends#index', as: 'root'
  get 'dashboard', to: 'friends#dashboard', as: 'dashboard'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
