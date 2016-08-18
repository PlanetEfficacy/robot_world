require_relative "../test_helper"

class RobotWorldAnalystTest < Minitest::Test
  include TestHelpers

  attr_reader :analyst

  def setup
    data_for_ten_robots.each { |data| robot_world.create(data) }
    @analyst = RobotWorldAnalyst.new(robot_world)
  end

  def test_it_has_a_robot_world
    assert_equal 10, analyst.all.length
  end

  def test_it_knows_average_robot_age
    assert_equal 11, analyst.average_age
  end

  def test_it_can_group_by_year_hired
    grouped_robots = analyst.group_by_year_hired

    assert_equal 5, grouped_robots[2016].length
    assert_equal 1, grouped_robots[2006].length
    assert_equal nil, grouped_robots[1950]
  end

  def test_it_can_prepare_year_hired_data_view
    data_view = analyst.year_hired_data_view

    assert_equal 5, data_view[2016]
    assert_equal 1, data_view[2006]
    assert_equal 2, data_view[2001]
    assert_equal 2, data_view[1990]
  end

  def test_it_can_group_by_department
    grouped_robots = analyst.group_by_department

    assert_equal 6, grouped_robots["a bad department"].length
    assert_equal 4, grouped_robots["a great department"].length
  end

  def test_it_can_prepare_department_data_view
    data_view = analyst.department_data_view

    assert_equal 6, data_view["a bad department"]
    assert_equal 4, data_view["a great department"]
  end

  def test_it_can_group_by_city
    grouped_robots = analyst.group_by_city

    assert_equal 8, grouped_robots["Denver"].length
    assert_equal 2, grouped_robots["Boulder"].length
  end

  def test_it_can_prepare_city_data_view
    data_view = analyst.city_data_view

    assert_equal 8, data_view["Denver"]
    assert_equal 2, data_view["Boulder"]
  end

  def test_it_can_group_by_state
    grouped_robots = analyst.group_by_state

    assert_equal 10, grouped_robots["Colorado"].length
  end

  def test_it_can_prepare_state_data_view
    data_view = analyst.state_data_view

    assert_equal 10, data_view["Colorado"]
  end


  def data_for_ten_robots
    [{:name => "T101", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T102", :city => "Boulder", :state => "Colorado",
      :birthdate => "2004-08-16", :date_hired => "2006-08-17",
      :department => "a bad department"},
      {:name => "T103", :city => "Boulder", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T104", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T105", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T106", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"},
      {:name => "T107", :city => "Denver", :state => "Colorado",
      :birthdate => "1983-08-16", :date_hired => "1990-08-17",
      :department => "a great department"},
      {:name => "T108", :city => "Denver", :state => "Colorado",
      :birthdate => "1983-08-16", :date_hired => "1990-08-17",
      :department => "a great department"},
      {:name => "T109", :city => "Denver", :state => "Colorado",
      :birthdate => "2000-08-16", :date_hired => "2001-08-17",
      :department => "a great department"},
      {:name => "T110", :city => "Denver", :state => "Colorado",
      :birthdate => "2000-08-16", :date_hired => "2001-08-17",
      :department => "a great department"}]
  end

end
