Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :index]
  end
  resources :categories, only: [:show]
  get :dashboard, controller: :dashboards, action: :editor_dashboard
  post :approve, controller: :dashboards, action: :approve_article
  root controller: :articles, action: :index
end
