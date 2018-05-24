class ArticlesController < ApplicationController

# before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all
  end

end
