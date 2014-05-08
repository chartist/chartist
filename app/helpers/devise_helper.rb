module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-warning alert-dismissable"> <button type="button"
    class="close" data-dismiss="alert" aria-hidden="true">x</button>
      #{messages}
      </div>
      HTML

      html.html_safe
    end
  end
