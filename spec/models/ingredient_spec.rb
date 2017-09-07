require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it "has a name" do
    ingredient = Ingredient.create(name: 'Bread Flour')
    
    expect(ingredient.name).to eq('Bread Flour')
  end
  
  it "can have a different name" do
    ingredient = Ingredient.create(name: 'Cinnamon')
    
    expect(ingredient.name).to_not eq('Bread Flour')
    expect(ingredient.name).to eq('Cinnamon')
  end
end
