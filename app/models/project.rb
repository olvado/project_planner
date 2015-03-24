class Project < ActiveRecord::Base
  has_many :resources

  validates :color, css_hex_color: true

  accepts_nested_attributes_for :resources, reject_if: proc { |attributes| attributes['name'].blank? || attributes['allocation'].blank? }, allow_destroy: true

  before_validation :set_end_at

  def to_s
    name
  end

  def week
    start_at.to_date.cweek
  end

  def total_fees
    return 0.to_d unless resources.any?
    resources.map(&:fee).sum.round(2)
  end

  def invert_color
    colour = color
    new_color = ColorMath::hex_color(colour)
    white = ColorMath::hex_color("#ffffff")
    black = ColorMath::hex_color("#000000")
    blend_with = new_color.luminance <= 0.5 ? white : black
    ColorMath::Blend.alpha(blend_with, new_color, 0.2).hex
  end

private

  def set_end_at
    date = (start_at + weeks.weeks).end_of_week.end_of_day
    update_attribute(:end_at, date)
  end

end
