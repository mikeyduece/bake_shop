require 'rails_helper'

feature "User" do
  context "once logged in" do
    scenario  "can edit recipe" do
      recipe = Recipe.create(name: 'Baguette')
      recipe.ingredients = create_list(:ingredient, 3)
      recipe.recipe_ingredients = create_list(:recipe_ingredient, 3)
      visit recipe_path(recipe)
      click_on('Edit Ingredient', match: :first)
      fill_in('Amount', with: 7.5)
      save_and_open_page
      click_on('Update Amount')

      expect(page).to have_content(7.5)
    end
  end
end