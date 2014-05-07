class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
    :recoverable, :rememberable, :omniauthable,
    :omniauth_providers => [:facebook, :linkedin, :google_oauth2]
  #, :validatable

  validates :password, presence: { message: "is required" }, length: { minimum: 8, message: "is too short!" }

  has_many :charts
  has_many :dashboards

  after_create :send_email, :create_user_dashboard

  def send_email
    UserMailer.welcome_notification.deliver
  end

  def self.find_for_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.username = auth.info.email.split('@').first
      user.password = Devise.friendly_token[0,20]
    end
  end

  def create_user_dashboard
    dashboards << Dashboard.create(title: self.username, user_id: self.id)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
