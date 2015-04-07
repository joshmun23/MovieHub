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

  scenario 'deletes a review', js: true do
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review, movie: movie, user: user)

    visit movie_path(movie)
    #save_screenshot("capybara-js.png")
    find('.vote-up').click_link 'Up vote'

    within 'p.votes' do
      expect(page).to have_content('1')
    end
  end
end
