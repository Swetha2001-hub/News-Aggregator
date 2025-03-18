class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }, if: :password_required?
    
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
  end
  def password_required?
    new_record? || password.present?
  end