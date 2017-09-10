require 'rails_helper'

feature "As a User" do
  scenario "can add an ingredient" do
    user = User.create(username: 'mike', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    ingredient = Ingredient.create!(name: 'Bread Flour')
    ingredient_2 = Ingredient.create!(name: 'Wheat Flour')
    recipe = Recipe.create!(name: 'Baguette', owner_id: user.id)

    visit user_recipe_path(user,recipe)
    click_on('Add Ingredient')
    
    expect(current_path).to eq(new_user_recipe_ingredient_path(user,recipe))
    
    select ingredient.name, from: 'recipe_ingredient[ingredient_id]'
    fill_in('Amount', with: 24.5)
    click_on('Add Ingredient')
    # expect(current_path).to eq(recipe_path("#{recipe.id}"))
    expect(page).to have_content('Bread Flour')
  end
end