module LikesHelper
  def set_class_liked(article)
    if article.likes.blank?
      'like'
    else
      'like liked'
    end
  end
end
