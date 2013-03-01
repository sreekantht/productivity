Bootstrap::Application.routes.draw do
  
  resources :users


  resources :users
  get 'signup' => 'users#new', as: :signup

  resources :sessions
  get 'login' => 'sessions#new', as: :login
  get 'logout' => 'sessions#destroy', as: :logout
  
  root to: 'users#index'
  # root to: 'todos#index' # куда идти после логина, *обязательно указать
  
end
