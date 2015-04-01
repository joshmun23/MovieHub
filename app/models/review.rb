class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :user,
    presence: true

  validates :body,
    presence: true

  validates :movie,
    presence: true
end
