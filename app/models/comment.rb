class Comment < ActiveRecord::Base

  belongs_to :article
  belongs_to :user

  validates :content, :presence => true
  validates :article_id, :presence => true
  validates :user_id, :presence => true
end
