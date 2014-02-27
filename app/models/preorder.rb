class Preorder < ActiveRecord::Base

  validates :first_name, :last_name, :email, :address, :city,
            :state, :zipcode, :stripe_customer_id, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
