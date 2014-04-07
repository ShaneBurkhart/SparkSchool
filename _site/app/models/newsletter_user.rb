class NewsletterUser < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\S+@\S+\.\S+/
end
