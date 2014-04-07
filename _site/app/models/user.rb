class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable,
  # :registerable, :rememberable, :trackable,
  devise :database_authenticatable, :validatable

  validate :role_type

  def admin?
    return self.role == "Admin"
  end

  def user?
    return self.role == "User"
  end


  private

    def valid_roles
      return ["Admin"]
    end

    def role_type
      errors.add(:role, "Invalid role type") unless valid_roles.include?(self.role)
    end

end
