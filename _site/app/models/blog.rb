class Blog < ActiveRecord::Base
  validates :title, :body, :tag, presence: true

  def link_title
    return self.title.gsub(/[^a-zA-Z0-9\s\-]/, '').gsub(/\s+/, "-").gsub(/\-+\z/, '').downcase
  end
end
