class Lesson < ActiveRecord::Base
  validates :name, :description, :unit_id, :lesson_number, presence: true
  validate :duplicate_lesson_number_for_unit

  belongs_to :unit

  private

    def duplicate_lesson_number_for_unit
      errors.add(:lesson_number, "already exists for this unit") if Lesson.find_by(unit_id: self.unit_id, lesson_number: self.lesson_number)
    end
end
