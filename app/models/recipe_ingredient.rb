class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def ing_name
    Ingredient.find(ingredient_id).name
  end
  
  # def flours_amt(recipe_id)
  #   RecipeIngredient.select('ingredients.name')
  #     .joins(:ingredient)
  #     .where(recipe_id: recipe_id)
  #     .where('ingredients.name like ?', '%Flour%')
  #     .sum(:amount)
  # end
end
