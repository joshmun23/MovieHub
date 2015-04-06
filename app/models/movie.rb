class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :year, presence: true
  validates :user,
    presence: true

  paginates_per 25
end
