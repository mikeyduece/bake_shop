class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
  
  has_many :user_recipes
  has_many :users, through: :user_recipes
  
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  
  def recipe_ingredient
    RecipeIngredient.where(recipe_id: id)
  end
end
