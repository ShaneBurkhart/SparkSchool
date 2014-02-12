# Class for sending emails to the admins
class AdminMailer < ActionMailer::Base
  default from: "\"Spark School Projects\" <projects@sparkschool.co>"

  def hack_and_tell_email(email, message)
    mail(to: 'team@sparkschool.co',
      subject: 'Spark School Hack and Tell',
      body: "#{email} sent: \n\n #{message}")
  end

end
