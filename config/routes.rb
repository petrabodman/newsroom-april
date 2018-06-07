Rails.application.routes.draw do

  devise_for :users, controllers: { registration: "registrations" }
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :index]
end
  resources :categories, only: [:show]
  root controller: :articles, action: :index
  resources :subscriptions, only: [:new, :create]
  post '/charges', controller: :subscriptions, action: :create
end
