Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
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

  get 'calendar', to: 'pages#calendar', as: 'calendar'
  get 'chatrooms/:name', to: 'chatrooms#show', as: 'chatroom_by_name'

  root 'pages#home'
  get 'start_shift', to: 'pages#start_shift', as: 'start_shift'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'team', to: 'pages#team', as: 'team'
  get 'team/:id', to: 'pages#profile', as: 'profile'
  get 'mentions', to: 'mentions#index', as: 'mentions'
  get 'username_suggestions', to: 'username_suggestions#index'
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  get '/test_500', to: 'application#test_500'
end
