class Lesson < ActiveRecord::Base
  validates :name, :description, :body, :unit_id, :lesson_number, presence: true
  validate :duplicate_lesson_number_for_unit

  belongs_to :unit
  validates_presence_of :unit

  private

    def duplicate_lesson_number_for_unit
      @lesson = Lesson.find_by(unit_id: self.unit_id, lesson_number: self.lesson_number)
      errors.add(:lesson_number, "already exists for this unit") if @lesson && @lesson.id != self.id
    end
end
