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

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'team', to: 'pages#team', as: 'team'
  get 'team/:id', to: 'pages#profile', as: 'profile'
end
