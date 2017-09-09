class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
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
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
      # this is the key for your recipe to save ingredients 
  end
end
