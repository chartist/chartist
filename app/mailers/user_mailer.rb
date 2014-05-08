class UserMailer < ActionMailer::Base
  default from: "welcome@chartist.com"

  def welcome_notification
    @user = User.last
    mail(to: @user.email, subject: 'Welcome to Chartist')
    attachments.inline['chartist_avatar.png'] = File.read(Rails.root.join('public', 'images', 'chartist_avatar.png'))
  end

end
