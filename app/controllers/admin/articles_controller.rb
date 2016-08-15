class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    authorize! :manage, @articles
  end

  def create
    authorize! :manage, :create
    Article.create(article_params())
    redirect_to admin_articles_path
  end

  def new
    authorize! :manage, :new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    authorize! :manage, @article
  end

  def edit
    @article = Article.find(params[:id])
    authorize! :manage, @article
  end

  def update
    article = Article.find(params[:id])
    authorize! :manage, article
    article.update!(article_params())
    redirect_to edit_admin_article_path(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    authorize! :manage, article
    article.destroy
    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:name, :text)
    end
end
