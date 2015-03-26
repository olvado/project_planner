class Project < ActiveRecord::Base
  has_many :resources

  validates :color, css_hex_color: true
  validates_presence_of :name, :fee, :start_at, :weeks

  accepts_nested_attributes_for :resources, reject_if: proc { |attributes| attributes['name'].blank? || attributes['allocation'].blank? }, allow_destroy: true

  before_validation :set_end_at, :set_random_hex

  def to_s
    name
  end

  def week
    start_at.to_date.cweek
  end

  def total_fees
    return 0 unless resources.any?
    resources.collect(&:fee).sum.round(2)
  end

  def weeks_for_select
    year_start = Date.today.beginning_of_year.beginning_of_week
    year_end   = Date.today.end_of_year.end_of_week
    mondays    = (year_start..year_end).to_a.select {|k| [1].include?(k.wday) }.map{ |d| d.strftime("%a %d %b %Y") }
  end

private

  def set_end_at
    date = (start_at + weeks.weeks).end_of_week.end_of_day
    update_attribute(:end_at, date)
  end

  def set_random_hex
    return if color.present?
    update_attribute(:color, "##{SecureRandom.hex(3)}")
  end

end
