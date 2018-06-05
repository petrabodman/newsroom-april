Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :api, only: [:index], constraints:{ format: :json }
    end
  end
  devise_for :users
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :index]
  end
  resources :categories, only: [:show]
  root controller: :articles, action: :index
end
