class RobotWorldAnalyst
  attr_reader :all

  def initialize(robot_world)
    @all = robot_world.all
  end

  def average_age
    all.map { |robot| robot.age }.reduce(:+) / all.length
  end

  def group_by_year_hired
    all.group_by { |robot| robot.year_hired }
  end

  def year_hired_data_view
    group_by_year_hired.to_a.map do |year_data|
      [year_data[0], year_data[1].length]
    end.to_h
  end

  def group_by_department
    all.group_by { |robot| robot.department }
  end

  def department_data_view
    group_by_department.to_a.map do |department_data|
      [department_data[0], department_data[1].length]
    end.sort.to_h
  end

  def group_by_city
    all.group_by { |robot| robot.city }
  end

  def city_data_view
    group_by_city.to_a.map do |city_date|
      [city_date[0], city_date[1].length]
    end.sort.to_h
  end

  def group_by_state
    all.group_by { |robot| robot.state }
  end

  def state_data_view
    group_by_state.to_a.map do |state_date|
      [state_date[0], state_date[1].length]
    end.sort.to_h
  end
end
