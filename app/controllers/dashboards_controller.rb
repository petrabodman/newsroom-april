class DashboardsController < ApplicationController
  def editor_dashboard
    @articles = Article.where(published: false)
  end

  def approve_article
    article = Article.find(params[:format])
    article.update(published: true)
    render 'editor_dashboard'
  end

end
