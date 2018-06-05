Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :api, only: [:index], constraints:{ format: :json }
  devise_for :users
  end
end
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :index]
  end
  resources :categories, only: [:show]
  root controller: :articles, action: :index
end
