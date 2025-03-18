class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :favorite
  has_many :likes, as: :likeable, dependent: :destroy
  validates :content, presence: true
 
end
