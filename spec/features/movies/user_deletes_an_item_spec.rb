require 'rails_helper'

feature 'user deletes a movie', %{
  As an authenticated user
  I want to delete an movie
  So that no one can review it
} do
  scenario 'delete existing movie' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    movie = FactoryGirl.create(:movie)
    movie_title = movie.title
    movie_year = movie.year

    visit edit_movie_path(movie)

    click_button 'Delete this Movie'

    expect(page).to_not have_content(movie_title)
    expect(page).to_not have_content(movie_year)
  end
end
