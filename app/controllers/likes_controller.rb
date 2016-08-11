class LikesController < ApplicationController
  before_filter :authenticate_user!

  def like
    like = Like.new
    like.article_id = params[:article_id]
    like.user_id = current_user.id
    like.save
    head :no_content
  end

  def dislike
    like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    like.destroy
    head :no_content
  end
end
