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
    redirect_to user_recipe_path(current_user,@recipe)
  end  
  
  def edit
    @recipe_ingredient = RecipeIngredient.find(params[:recipe_ingredient_id])
    
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    recipe_ingredient = RecipeIngredient.find(params[:recipe_id])
    recipe_ingredient.update(amount: params[:recipe_ingredient][:recipe_ingredients][:amount].to_f)
    # require "pry"; binding.pry
    redirect_to user_recipe_path(current_user,@recipe)
  end
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:name, {:recipe_ids=>[]})
  end
end