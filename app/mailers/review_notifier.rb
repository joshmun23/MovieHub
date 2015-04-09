class ApplicationMailer < ActionMailer::Base
  default from: "reviews@example.com"
end

class ReviewNotifier < ApplicationMailer
  default from: "reviews@example.com"

  def new_review(review)
    @review = review

    mail(
      to: 'risky@duncanrose.com',
      subject: "New Review for #{review.movie.title}")
  end
end
