require 'rails_helper'

feature 'user add votes', %{
  As a authenticated user
  I want to vote up or down
  So I can voice my opinion
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'vote a review up' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie)

    visit movie_path(movie)

    first('.vote-up').click_link 'Up'

    expect(page).to have_content(movie.title)
    expect(page).to have_content(review.body)
    expect('.review-0').to have_content('1')
  end

  scenario 'vote a review down' do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie)

    visit movie_path(movie)

    first('.vote-down').click_link 'Down'

    expect(page).to have_content(movie.title)
    expect(page).to have_content(review.body)
    expect('.votes').to have_content('-1')
  end
end
