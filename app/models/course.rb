class Course < ActiveRecord::Base
  validates :name, :description, :tag, presence: true
  validates :tag, uniqueness: true

  has_many :units
end
