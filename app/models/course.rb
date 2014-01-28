class Course < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :units
end
