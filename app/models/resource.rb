class Resource < ActiveRecord::Base
  belongs_to :project

  ROLES = [ 
      { name: "Partner", fee: 6000.00, allocation: 0.2 },
      { name: "Senior strategist", fee: 6000.00, allocation: 0.4 },
      { name: "Creative technologist", fee: 6000.00, allocation: 0.2 },
      { name: "Back-end developer", fee: 5000.00, allocation: 0.7 },
      { name: "Front-end developer", fee: 5000.00, allocation: 0.7 },
      { name: "Senior designer", fee: 5000.00, allocation: 0.4 },
      { name: "Product manager", fee: 5000.00, allocation: 0.8 },
      { name: "Producer", fee: 4500.00, allocation: 0.2 },
      { name: "Quality assurance", fee: 4500.00, allocation: 0.3 }
    ]

  def to_s
    name
  end

end
