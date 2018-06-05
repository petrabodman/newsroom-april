class Api::V1::ApiController < ApplicationController
  def index
    article = Article.all
    render json: { article: article }
  end
end
