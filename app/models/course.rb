class Course < ActiveRecord::Base
  validates :name, :description, :tag, :published, presence: true
  validates :tag, uniqueness: true

  has_many :units, dependent: :destroy

  def published?
    return self.published
  end
end
