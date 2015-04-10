module ApplicationHelper

  def icon(icon, text="")
    content_tag(:span, text, class: "icon-#{icon}")
  end

end
