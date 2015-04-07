require 'rails_helper'

feature 'user votes on a review', %{
  As a authenticated user
  I want to vote a review
  So I can help others
} do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    sign_in_as user
  end

  scenario 'upvote', js: true do
    review = FactoryGirl.create(:review, user: user)
    movie = review.movie

    visit movie_path(movie)
    find('.vote-up').click_link 'Up vote'

    within 'p.votes' do
      expect(page).to have_content('1')
    end
  end

  scenario 'downvote', js: true do
    review = FactoryGirl.create(:review, user: user)
    movie = review.movie

    visit movie_path(movie)
    find('.vote-down').click_link 'Down vote'

    within 'p.votes' do
      expect(page).to have_content('-1')
    end
  end

  scenario 'upvote twice', js: true do
    review = FactoryGirl.create(:review, user: user)
    movie = review.movie

    visit movie_path(movie)
    find('.vote-up').click_link 'Up vote'
    find('.vote-up').click_link 'Up vote'

    within 'p.votes' do
      expect(page).to have_content('1')
    end
  end
end
