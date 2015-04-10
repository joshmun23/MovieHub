require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:user_name) {|n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    admin false

    factory :user_with_photo do
      profile_photo { Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/reel.jpeg") }
    end
  end

  factory :movie do
    sequence(:title) { |n| "Ocean's 1#{n}" }
    sequence(:year) { |n| "202#{n}" }
    user
  end

  factory :review do
    body 'this is a review hahaha'
    user
    movie
  end
end
