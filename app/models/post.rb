class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  validates_presence_of :message, :user
end
