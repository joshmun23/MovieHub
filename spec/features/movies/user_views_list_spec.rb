require 'rails_helper'

feature 'user view a movie', %{
  As an authenticated user
  I want to view a list of movies
  So that I can pick movies to review
} do
  scenario 'see movie' do
    movies = []
    5.times do
      movies << FactoryGirl.create(:movie)
    end

    visit movies_path

    expect(page).to have_content(movies[0].title)
    expect(page).to have_content(movies[1].title)
    expect(page).to have_content(movies[2].title)
    expect(page).to have_content(movies[3].title)
    expect(page).to have_content(movies[4].title)
  end

  scenario 'view details of an movie' do
    movie = FactoryGirl.create(:movie)

    visit movies_path

    click_link movie.title

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.year)
  end
end
