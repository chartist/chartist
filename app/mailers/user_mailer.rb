class UserMailer < ActionMailer::Base
  default from: "welcome@chartist.com"

  def welcome_notification
    @user = User.last
    attachments.inline['logo.png'] = File.read('../assets/images/mailer/logo.png')
    mail(to: @user.email, subject: 'Welcome to Chartist')
  end

end
