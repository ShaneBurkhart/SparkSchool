class LessonRating < ActiveRecord::Base
  validates :lesson_id, :user_id, :liked, :user, :lesson, presence: true

  belongs_to :lesson
  belongs_to :user

  def like?
    return self.liked
  end
end
