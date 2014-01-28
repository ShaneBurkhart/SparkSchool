class IncomingMail < ActiveRecord::Base
  validates :to, :from, :body, :subject, presence: true
end
