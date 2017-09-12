require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  it "can find an ingredients name" do
    user              = create(:user)
    recipe            = create(:recipe, owner: user)
    recipe_ingredient = create(:recipe_ingredient, recipe: recipe)
    
    expect(recipe_ingredient.ing_name).to eq(recipe_ingredient.ingredient.name)
  end
  
  

end
