require 'rails_helper'

feature 'user add review', %{
  As a authenticated user
  I want to add a review
  So that others can see it
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'add a review to a movie' do
    movie = FactoryGirl.create(:movie)

    visit movie_path(movie)

    fill_in 'review_body', with: 'This movie is awesome!'

    click_button 'Create Review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('This movie is awesome!')
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario 'add an empty review' do
    movie = FactoryGirl.create(:movie)

    visit movie_path(movie)

    fill_in 'review_body', with: ""

    click_button 'Create Review'

    expect(page).to have_content(movie.title)
    expect(page).to have_content('Body can\'t be blank')
  end
end
