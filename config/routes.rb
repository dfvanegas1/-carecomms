Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks, only: [:index, :show, :update] do
    resources :comments, only: :create
  end

  resources :shifts, only: [:edit, :update]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'team', to: 'pages#team', as: 'team'
  get 'team/:id', to: 'pages#profile', as: 'profile'
end
