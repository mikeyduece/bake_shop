require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "can have a name" do
    recipe = Recipe.create(name: 'Baguette')
    
    expect(recipe.name).to eq('Baguette')
  end
  
  it "can have a different name" do
    recipe   = Recipe.create(name: 'Baguette')
    recipe_2 = Recipe.create(name: 'Cinnamon Roll')
    
    expect(recipe_2.name).to eq('Cinnamon Roll')
    expect(recipe_2.name).to_not eq('Baguette')
  end
  
  it "can add flour ingredients together" do
    user              = create(:user)
    recipe            = create(:recipe, owner: user)
    recipe_ingredient = create(:recipe_ingredient, recipe: recipe)

    expect(recipe.flours_amt(recipe.id)).to eq(1.5)
  end
end
