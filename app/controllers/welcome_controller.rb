class WelcomeController < ApplicationController
  def index
    page = (params[:page].blank?) ? 1 : Integer(params[:page])
    per_page = 1
    @articles = Article.joins("LEFT JOIN likes ON articles.id = likes.article_id AND likes.user_id = #{current_user.id}").limit(per_page).offset((page - 1) * per_page)
    @articles_paginate = Article.paginate(:page => params[:page], :per_page => per_page)
  end

  def tag
    @articles = Article.joins(:articles_to_tags).where('articles_to_tags.tag_id' => params[:id])
    render :index
  end
end
