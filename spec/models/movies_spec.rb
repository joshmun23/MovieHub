require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should belong_to :user }

  it { should have_valid(:title).when('New Movie') }
  it { should have_valid(:year).when(1987) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }

  it { should_not have_valid(:title).when("") }
  it { should_not have_valid(:year).when("") }
  it { should_not have_valid(:user).when(nil) }
end
