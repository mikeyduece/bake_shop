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
end
