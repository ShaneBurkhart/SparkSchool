class BetaUser < ActiveRecord::Base
  validates :email, :sign_up_form, presence: true
  validates_format_of :email, with: /\S*@\S*\.\S*/

  before_validation :ensure_sign_up_form

  private
    def ensure_sign_up_form
      self.sign_up_form ||= "Form"
    end
end
