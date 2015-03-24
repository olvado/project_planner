class ResourceDecorator < Draper::Decorator
  delegate_all

  def project_fee
    weeks = project.weeks
    project_fee = (fee * allocation) * weeks
  end

  def bar
    h.content_tag :div, "", class: "resource-bar", style: "width: #{h.number_to_percentage(allocation * 100, precision: 0)}"
  end

end
