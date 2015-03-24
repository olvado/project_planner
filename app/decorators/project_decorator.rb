class ProjectDecorator < Draper::Decorator
  delegate_all

  def allocated_fee
    resources.map(&:decorate).map(&:project_fee).sum
  end

  def fee_diff
    fee - allocated_fee
  end

end
