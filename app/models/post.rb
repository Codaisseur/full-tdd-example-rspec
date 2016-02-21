class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  validates_presence_of :message, :user

  def like_from(user)
    likes.where(user: user).first
  end
end
