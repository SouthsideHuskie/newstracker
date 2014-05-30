class Article < ActiveRecord::Base

  belongs_to :user
  has_many :favorites
  has_many :fans, :through => :favorites, :source => :user
  has_many :tags
  has_many :comments

end
