require 'rails_helper'

feature "As a User" do
  scenario "can add an ingredient" do
    ingredient = Ingredient.create!(name: 'Bread Flour')
    ingredient_2 = Ingredient.create!(name: 'Wheat Flour')
    recipe = Recipe.create(name: 'Baguette')

    visit recipe_path(recipe)
    click_on('Add Ingredient')
    
    expect(current_path).to eq(new_recipe_ingredient_path(recipe))
    
    select ingredient.name, from: 'recipe_ingredient[ingredient_id]'
    fill_in('Amount', with: 24.5)
    click_on('Add Ingredient')
    # expect(current_path).to eq(recipe_path("#{recipe.id}"))
    expect(page).to have_content('Bread Flour')
  end
end