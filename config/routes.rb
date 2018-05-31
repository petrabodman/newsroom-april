Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :index]
  end
  resources :categories, only: [:show]
  get :dashboard, controller: :dashboards, action: :editor_dashboard
  post :approve_article, controller: :dashboards, action: :approve_article
  post :approve_comment, controller: :dashboards, action: :approve_comment
  root controller: :articles, action: :index
end
