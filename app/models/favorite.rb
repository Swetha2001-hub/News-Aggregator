class Favorite < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy 
  validates :article_url, uniqueness: { scope: :user_id, message: "You have already saved this article." }
end

