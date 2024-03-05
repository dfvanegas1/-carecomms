Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resources :tasks, only: [:index, :show, :update] do
      resources :comments, only: :create
    end
    resources :shifts, only: [:index, :edit, :update]
  end

  resources :tasks

  resources :shifts, only: [:index, :show, :update]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'

end
