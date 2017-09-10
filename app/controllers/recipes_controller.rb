class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.owned_recipes(params[:user_id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe)
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredient
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_ingredients = RecipeIngredient.update_attributes(params[:recipe][:recipe_ingredients_attributes])
    redirect_to recipe_path(@recipe)
  end
  
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_recipes_path(current_user)
  end
  
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name,
                                   :recipe_ingredients_attributes => [:id, :amount],
                                   :ingredient_ids => [])
  end
end
