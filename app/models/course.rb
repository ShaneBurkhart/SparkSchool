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

  def progress current_user
    return 0 if !current_user
    comp = 0
    tot = 0
    self.units.each do |unit|
      unit.lessons.each do |lesson|
        comp += 1 if current_user.completed_lesson?(lesson.id)
        tot += 1
      end
    end
    if tot > 0
      comp * 100.0 / tot
    else
      0
    end
  end

end
