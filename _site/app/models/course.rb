class Course < ActiveRecord::Base
  validates :name, :description, :tag, presence: true
  validates :tag, uniqueness: true

  has_many :units, dependent: :destroy

  def published?
    return self.published
  end

  def ordered_lessons
    lessons = []
    self.ordered_units.each do |unit|
      unit.lessons.order(lesson_number: :asc).each do |lesson|
        lessons << lesson
      end
    end
    lessons
  end

  def ordered_units
    self.units.order(unit_number: :asc)
  end

end
