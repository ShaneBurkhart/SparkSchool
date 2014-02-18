class LessonRating < ActiveRecord::Base
  validates :lesson_id, :user_id, :user, :lesson, presence: true
  validate :unique_for_user

  belongs_to :lesson
  belongs_to :user

  def like?
    return self.liked
  end

  private

    def unique_for_user
      @lesson_rating = LessonRating.find_by(lesson_id: self.lesson_id, user_id: self.user_id)
      errors.add(:user_id, "lesson rating with that lesson already exists for user") if @lesson_rating && @lesson_rating.id != self.id
    end
end
