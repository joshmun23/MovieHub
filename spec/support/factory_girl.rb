require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:user_name) {|n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    admin false
  end
end

FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Ocean's 1#{n}"}
    sequence(:year) { |n| "202#{n}" }
    sequence(:user_id) { |n| n + 1 }
  end

  factory :movie_revise do
    title "Ocean's 20"
    year "2030"
  end
end
