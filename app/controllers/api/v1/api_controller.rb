class Api::V1::ApiController < ApplicationController
  # protect_from_forgery with: :null_session
  #
  # before_action :destroy_session
  #
  # def destroy_session
  #   request.session_options[:skip] = true
  # end

  def index
    article = Article.all
    render json: { article: article }
  end
end