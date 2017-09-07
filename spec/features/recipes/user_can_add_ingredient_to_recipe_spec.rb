require 'rails_helper'

feature "As a User" do
  scenario "can add an ingredient" do
    ingredient = Ingredient.create!(name: 'Bread Flour')
    recipe = Recipe.create(name: 'Baguette')

    visit recipe_path(recipe)
    click_on('Add Ingredient')

    expect(current_path).to eq(new_recipe_ingredient_path(recipe))
    #select from dropdown ingredient
    select ingredient.name, from: 'recipe_ingredient[ingredient_id]'
  end
end