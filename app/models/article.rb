class Article < ActiveRecord::Base
  belongs_to :user, foreign_key: "author_id"
  has_many :articles_to_tags
  has_many :tags, :through => :articles_to_tags
  has_many :likes
  has_many :users, :through => :likes
end
