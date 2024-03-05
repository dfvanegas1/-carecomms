Rails.application.routes.draw do
  get 'messages/create'
  get 'chatrooms/show'
  get 'shifts/index'
  get 'shifts/edit'
  get 'shifts/update'
  get 'comments/create'
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/update'
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  # resource :session, only: [:new, :create, :destroy]

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

  get 'dashboard', to: 'dashboard#index'

  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'

  root 'dashboard#index'

end
