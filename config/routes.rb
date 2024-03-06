Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks, only: [:index, :show, :update, :new, :create] do
    resources :comments, only: :create
    member do
      post :add_user
      delete :remove_user_from_task
      patch :toggle_completion
    end
  end

  resources :shifts, only: [:edit, :update]

  resources :chatrooms, only: [] do # Exclude :show from the automatically generated routes
    resources :messages, only: :create
  end

  resources :mention_comments, only: [:create]
  resources :mention_messages, only: [:create]

# Custom route for chatroom show action to use name instead of id
get 'chatrooms/:name', to: 'chatrooms#show', as: 'chatroom_by_name'

  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'team', to: 'pages#team', as: 'team'
  get 'team/:id', to: 'pages#profile', as: 'profile'
end
