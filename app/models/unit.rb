class Unit < ActiveRecord::Base
  validates :name, :course_id, :unit_number, presence: true
  validate :duplicate_unit_number_for_course

  belongs_to :course

  has_many :lessons, dependent: :destroy

  def ordered_lessons
    self.lessons.order(lesson_number: :asc)
  end

  private

    def duplicate_unit_number_for_course
      errors.add(:unit_number, "already exists for this course") if Unit.find_by(course_id: self.course_id, unit_number: self.unit_number)
    end
end
