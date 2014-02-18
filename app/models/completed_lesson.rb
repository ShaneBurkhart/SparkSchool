class CompletedLesson < ActiveRecord::Base
  validates :lesson_id, :lesson, :user_id, :user, presence: true
  validate :unique_for_user

  belongs_to :lesson
  belongs_to :user

  def unique_for_user
    @completed_lesson = CompletedLesson.find_by(lesson_id: self.lesson_id, user_id: self.user_id)
    errors.add(:user_id, "user already completed that lesson") if @completed_lesson && @completed_lesson.id != self.id
  end

end
