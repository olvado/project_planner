class Project < ActiveRecord::Base
  has_many :resources

  accepts_nested_attributes_for :resources, reject_if: proc { |attributes| attributes['name'].blank? || attributes['allocation'].blank? }, allow_destroy: true

  def to_s
    name
  end

end
