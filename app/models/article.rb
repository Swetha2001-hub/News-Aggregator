class Article < ApplicationRecord
    has_many :likes, as: :likeable, dependent: :destroy
  end
  