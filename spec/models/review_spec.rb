require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :user }
  it { should belong_to :movie }

  it { should have_valid(:body).when('New Review') }
  it { should validate_presence_of(:movie) }
  it { should validate_presence_of(:user) }

  it { should_not have_valid(:body).when("") }
end
