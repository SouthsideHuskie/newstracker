class Favorite < ActiveRecord::Base

belongs_to :article
belongs_to :user
  has_many :tags
end
