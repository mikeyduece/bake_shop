require 'rails_helper'

feature "User" do
  scenario "can be created" do
    visit new_user_path
    fill_in('Username', with: 'mike')
    fill_in('Password', with: 'password')
    click_on('Create Account')
    
    expect(page).to have_content('Welcome, mike!')
  end
  
  scenario 'can log in once they have an account' do
    user = User.create(username: 'mike', password: 'password')

    visit login_path
    fill_in('Username', with: user.username)
    fill_in('Password', with: 'password')
    click_on('Login')

    expect(page).to have_content('Welcome, mike!')
  end
  
  scenario "logged in user can logout" do
    user = User.create(username: 'mike', password: 'password')

    visit login_path
    fill_in('Username', with: user.username)
    fill_in('Password', with: 'password')
    click_on('Login')
    
    expect(page).to have_content('Welcome, mike!')
    
    click_on('Logout')
    
    expect(page).to_not have_content('Welcome, mike!')
  end
end