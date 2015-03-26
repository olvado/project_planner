class ProjectDecorator < Draper::Decorator
  delegate_all

  def allocated_fee
    resources.map(&:decorate).map(&:project_fee).sum
  end

  def fee_diff
    fee - allocated_fee
  end

  def invert_color
    new_color = ColorMath::hex_color(color)
    white = ColorMath::hex_color("#ffffff")
    black = ColorMath::hex_color("#000000")
    blend_with = new_color.luminance >= 0.55 ? white : black
    ColorMath::Blend.alpha(blend_with, new_color, 0.25).hex
  end

  def tint_color(amount = 0.2)
    new_color = ColorMath::hex_color(color)
    white = ColorMath::hex_color("#ffffff")
    ColorMath::Blend.alpha(white, new_color, amount).hex
  end

end
