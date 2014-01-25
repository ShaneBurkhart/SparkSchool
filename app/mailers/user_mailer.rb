class UserMailer < ActionMailer::Base
  default from: "team@sparkschool.co"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Spark School!')
  end
end
