class Api::V1::ApiController < ApplicationController
  def index
    article = Article.all
    category = Category.all
    render json: { article: article, category: category }
  end
end
