class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user,
    uniqueness: { scope: [:review, :vote_type] },
    presence: true

  validates :review,
    presence: true
end
