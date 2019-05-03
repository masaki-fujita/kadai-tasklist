Rails.application.routes.draw do
  get 'tasks/create'
  get 'tasks/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: "tasks#index"
    
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout" , to: "sessions#destroy"
    
    get "signup", to: "users#new"
    resources :users, only: [:index, :show, :new, :create]
    resources :tasks
    
end
