class RecipesController < ApplicationController
  
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
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
