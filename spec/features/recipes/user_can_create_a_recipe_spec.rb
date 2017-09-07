require 'rails_helper'

# As a user, I can visit the new recipe path 
# when I get there I see a field to enter a recipe name
# when I fill in the name and click on create, 
# I am redirected to the recipe show page

feature "As a user" do
  context 'I visit the new recipe page' do
    scenario 'and fill in the name field' do
      visit new_recipe_path
      expect(page).to have_content('New Recipe')
      
      fill_in('Name', with: 'Baguette')
      
      click_on('Create Recipe')
      expect(page).to have_content('Baguette Recipe')
    end
  end
end