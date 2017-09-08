class IngredientsController < ApplicationController
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
    @recipe_ingredient = RecipeIngredient.new
  end
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:recipe_ingredient][:ingredient_id])
    @recipe_ingredient = RecipeIngredient.create(recipe_id: @recipe.id,
                                          ingredient_id: @ingredient.id,
                                          amount: params[:recipe_ingredient][:amount]
                                            )
    redirect_to recipe_path(@recipe)
  end
  
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
    @recipe_ingredient = RecipeIngredient.new
  end
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:name, {:recipe_ids=>[]})
  end
end