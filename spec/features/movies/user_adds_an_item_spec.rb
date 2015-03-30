# As an authenticated user
# I want to add an item
# So that others can review it

require 'rails_helper'

feature 'user adds an item', %Q{
  # As an authenticated user
  # I want to add an item
  # So that others can review it

} do


  scenario 'add a valid item' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    # binding.pry
    # movie = FactoryGirl.create(:movie, title: "Godzilla Returns, Again")

    visit new_movie_path

    fill_in 'Title', with: "Godzilla Returns, Again"
    fill_in 'Year', with: "2021"

    click_button 'Create a New Movie'

    expect(page).to have_content('Movie Successfully Created')
    expect(page).to have_content("Godzilla Returns, Again")
  end
end
