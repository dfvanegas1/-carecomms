Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks do
    resources :comments, only: :create
    member do
      post :add_user
      patch :toggle_completion
    end
  end

  resources :user_tasks, only: [:destroy]
  resources :shifts, only: [:update]

  resources :chatrooms, only: [] do
    resources :messages, only: :create
  end

  resources :mention_comments, only: [:create]
  resources :mention_messages, only: [:create]

get 'chatrooms/:name', to: 'chatrooms#show', as: 'chatroom_by_name'
  get 'calendar', to: 'pages#calendar', as: 'calendar'

  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'team', to: 'pages#team', as: 'team'
  get 'team/:id', to: 'pages#profile', as: 'profile'
end
