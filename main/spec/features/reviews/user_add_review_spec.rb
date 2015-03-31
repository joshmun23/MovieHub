require 'rails_helper'

feature 'user add review', %Q{
  As a authenticated user
  I want to add a review
  So that others can see it
} do
  scenario 'add a review to a movie' do
    movie = FactoryGirl.create(:movie)

    visit movie_path(movie)

    fill_in 'Body', with: 'This movie is awesome!'

    click_button 'Add review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('This movie is awesome!')
  end

  scenario 'add an empty review' do
    movie = FactoryGirl.create(:movie)

    visit movie_path(movie)

    fill_in 'Review', with: ""

    click_button 'Add review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('The body can not be empty')
  end
end
