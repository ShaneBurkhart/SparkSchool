class Blog < ActiveRecord::Base
  validates :title, :body, :tag, presence: true
end
