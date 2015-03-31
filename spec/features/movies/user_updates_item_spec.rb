require 'rails_helper'

feature 'user updates an item', %{
  # As an authenticated user I want to update an item's information
  # So that I can correct errors or provide new information
} do
  scenario 'change item info' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    movie = FactoryGirl.create(:movie)
    new_movie_title = movie.title + "abc"

    visit edit_movie_path(movie)

    fill_in 'Title', with: new_movie_title
    fill_in 'Year', with: movie.year

    click_button 'Update Movie'

    expect(page).to have_content(new_movie_title)
    expect(page).to have_content(movie.year)
  end
end
