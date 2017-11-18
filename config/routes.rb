Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'auth/:provider/callback',  to: 'sessions#create'
  get 'login',                    to: 'welcome#login'
  get 'logout',                   to: 'sessions#destroy'

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  resources :messages, only: [:new, :create]
  resources :users, only: [:show]
  resources :dashboard, only: [:index]
  resources :missing_people

end
