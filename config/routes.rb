Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks, only: [:index, :show, :update, :new, :create] do
    resources :comments, only: :create
    put :mark_complete, on: :collection
  end

  resources :shifts, only: [:edit, :update]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  root 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
end
