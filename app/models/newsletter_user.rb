class NewsletterUser < ActiveRecord::Base
  validates :email, presence: true
end
