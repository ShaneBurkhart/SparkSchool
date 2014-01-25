class BetaUser < ActiveRecord::Base
  validate :email, :sign_up_form, presence: true

  before_validation :ensure_sign_up_form

  private
    def ensure_sign_up_form
      self.sign_up_form ||= "Form"
    end
end
