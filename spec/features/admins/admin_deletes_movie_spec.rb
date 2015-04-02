require 'rails_helper'

feature 'admin view users', %{
  As an admin
  I want to edit movies
  So that I can delete them for being bad
} do

  scenario 'delete individual movies' do
    movie = FactoryGirl.create(:movie)
    user = create_admin(:user)
    sign_in_as user

    visit movie_path(movie)

    click_button 'Delete'

    expect(page).to_not have_content(movie.title)
  end
end
