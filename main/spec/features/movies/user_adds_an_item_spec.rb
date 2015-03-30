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
    binding.pry
    movie = FactoryGirl.create(:movie)

    visit new_movie_path

    fill_in 'Title', with: movie.title
    fill_in 'Year', with: movie.year

    click_button 'Create a New Movie'

    expect(page).to have_content('Movie Successfully Created')
    expect(page).to have_content(movie.title)
  end
end
