class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :year, presence: true
  validates :user_id,

    presence: true,
    numericality: true
end
