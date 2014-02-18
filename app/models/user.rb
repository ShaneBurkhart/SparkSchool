class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :role_type

  has_many :completed_lessons

  def admin?
    return self.role == "Admin"
  end

  def user?
    return self.role == "User"
  end

  def completed_lesson? lesson_id
    CompletedLesson.find_by(lesson_id: lesson_id, user_id: self.id)
  end


  private

    def valid_roles
      return ["Admin", "User"]
    end

    def role_type
      errors.add(:role, "Invalid role type") unless valid_roles.include?(self.role)
    end

end
