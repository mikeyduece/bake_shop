class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def ing_name
    Ingredient.find(ingredient_id).name
  end
end
