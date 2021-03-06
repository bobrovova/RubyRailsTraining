class User < ActiveRecord::Base
  has_many :articles, foreign_key: "author_id"
  has_many :likes
  has_many :articles, :through => :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
