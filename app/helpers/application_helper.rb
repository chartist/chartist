module ApplicationHelper

  def gravatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(@chart.user.email.downcase)
    "http://gravatar.com/avatar/{gravatar_id}.png?s=300&d=mm"
  end

end

module Chartkick::Helper
	alias_method :col_chart, :column_chart
end


