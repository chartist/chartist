module ApplicationHelper

  def gravatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(@chart.user.email.downcase)
    "http://gravatar.com/avatar/{gravatar_id}.png?s=300&d=mm"
  end

  def user_dashboard(current_user)
    dash = Dashboard.find_by(title: current_user.username)
    dashboard_path(dash).html_safe
  end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end

module Chartkick::Helper
  alias_method :col_chart, :column_chart
end
