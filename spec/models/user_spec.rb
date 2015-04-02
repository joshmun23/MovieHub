require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :movies }

  it { should have_valid(:email).when("user@example.com") }
  it { should validate_presence_of(:user_name) }

  it { should_not have_valid(:email).when("foo", "foo.com", "@") }
  it { should_not have_valid(:user_name).when(nil) }
end
