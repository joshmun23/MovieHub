require 'rails_helper'

feature 'user view a movie', %{
  As an authenticated user
  I want to view a list of movies
  So that I can pick movies to review
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'see movie' do
    movie_1 << FactoryGirl.create(:movie)
    movie_2 << FactoryGirl.create(:movie, title: "title_2")
    movie_3 << FactoryGirl.create(:movie, title: "title_3")

    visit movies_path

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_3.title)
  end

  scenario 'view details of an movie' do
    movie = FactoryGirl.create(:movie)

    visit movies_path

    click_link movie.title

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.year)
  end
end
