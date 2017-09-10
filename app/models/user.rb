class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :user_recipes
  has_many :recipes, through: :user_recipes, dependent: :destroy
end
