class Admin::ArticlesController < ApplicationController
  def index
    authorize! :manage, :all
    @articles = Article.all
  end

  def create
    authorize! :manage, :all
    Article.create(article_params())
    redirect_to admin_articles_path
  end

  def new
    authorize! :manage, :all
    @article = Article.new
  end

  def show
    authorize! :manage, :all
    @article = Article.find(params[:id])
  end

  def edit
    authorize! :manage, :all
    @article = Article.find(params[:id])
  end

  def update
    authorize! :manage, :all
    article = Article.find(params[:id])
    article.update!(article_params())
    redirect_to edit_admin_article_path(params[:id])
  end

  def destroy
    authorize! :manage, :all
    article = Article.find(params[:id])
    article.destroy
    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:name, :text)
    end
end
