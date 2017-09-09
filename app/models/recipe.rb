class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
  
  def recipe_ingredient
    RecipeIngredient.where(recipe_id: id)
  end
end
