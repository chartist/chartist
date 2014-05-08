class UserMailer < ActionMailer::Base
  default from: "welcome@chartist.com"

  def welcome_notification
    @user = User.last
    mail(to: @user.email, subject: 'Welcome to Chartist')
    @image_url = File.read("#{Rails.root}/app/assets/images/navbar/chartist_avatar.png").html_safe
  end

end
