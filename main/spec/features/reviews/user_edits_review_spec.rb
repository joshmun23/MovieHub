require 'rails_helper'

feature 'user edits review', %Q{
  As a authenticated user
  I want to be able to edit a review
  So I can correct errors
} do
  scenario 'edit a review' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)

    visit movie_path(movie)

    click_link 'Edit'
    fill_in 'Review', with: 'This movie my new review'
    click_button 'Update review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('This movie my new review')
  end

  scenario 'edit a review with empty body' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)

    visit movie_path(movie)

    click_link 'Edit'
    fill_in 'Review', with: ""
    click_button 'Update review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('The body can not be empty')
  end
end
