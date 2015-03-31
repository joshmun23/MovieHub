require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:user_name) {|n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :movie do
    title 'The Dicktator'
    year '2012'
    user
  end

  factory :review do
    body 'this is a review hahaha'
    user
    movie
  end
end
