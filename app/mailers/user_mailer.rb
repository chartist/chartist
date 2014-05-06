class UserMailer < ActionMailer::Base
  default from: "welcome@chartist.com"

  def welcome_notification
    @user = User.last
    mail(to: @user.email, subject: 'Welcome to Chartist')
  end
end