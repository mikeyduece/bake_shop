require 'rails_helper'

feature "User" do
  context "once logged in" do
    scenario  "can edit recipe" do
      user = User.create(username: 'mike', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      recipe = Recipe.create!(name: 'Baguette', owner_id: user.id) 
      recipe.ingredients = create_list(:ingredient, 3)
      recipe.recipe_ingredients = create_list(:recipe_ingredient, 3)
      visit user_recipe_path(user,recipe)

      click_on('Edit Ingredient', match: :first)
      fill_in('Amount', with: 7.5)
      click_on('Update Amount')

      expect(page).to have_content(7.5)
    end
  end
end