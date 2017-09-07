class IngredientsController < ApplicationController
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
    @recipe_ingredient = RecipeIngredient.new
    # @recipe.ingredients << Ingredient.new
    # @ingredient = @recipe.ingredients.create(ingredient_params)
  end
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end