class Favorite < ActiveRecord::Base

belongs_to :article
belongs_to :user
  has_many :tags

  validates :user_id, :presence => true, :uniqueness => { :scope => :article_id }

  validates :article_id, :presence => true
end
