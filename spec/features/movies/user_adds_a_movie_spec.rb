require 'rails_helper'

feature 'user adds a movie', %{
  # As an authenticated user
  # I want to add an movie
  # So that others can review it
} do
  scenario 'add a valid movie' do
    user = FactoryGirl.create(:user)

    sign_in_as user

    visit new_movie_path

    fill_in 'Title', with: "Godzilla Returns, Again"
    fill_in 'Year', with: "2021"

    click_button 'Create a New Movie'

    expect(page).to have_content('Movie Successfully Created')
    expect(page).to have_content("Godzilla Returns, Again")
  end
end
