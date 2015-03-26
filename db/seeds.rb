
projects = Project.create([
    {
      name: "Finnair",
      color: "#2E8DD7",
      weeks: "12",
      fee: 400000.00,
      start_at: Date.today.beginning_of_week
    }, {
      name: "ITV Election",
      weeks: "12",
      fee: 155000.00,
      start_at: 3.weeks.ago.beginning_of_week
    }, {
      name: "Composed Incubator",
      weeks: "4",
      fee: 32000.00,
      start_at: Date.today.beginning_of_month.beginning_of_week
    }, {
      name: "Expedia",
      weeks: "8",
      fee: 190000.00,
      start_at: 6.weeks.ago.beginning_of_week
    }, {
      name: "V&A",
      weeks: "6",
      fee: 142450.00,
      start_at: 1.week.ago.beginning_of_week
    }
  ])

tp Project.all, :name, :color, :weeks, :fee, :start_at, :end_at


projects.each do |p|
  Resource::ROLES.each do |r|
    p.resources << Resource.create(r)
  end
end

tp Resource.all.map(&:decorate), :name, :fee, :project_fee
