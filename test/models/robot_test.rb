require_relative "../test_helper"

class RobotTest < Minitest::Test

  def robot_data
    { "id" => "1001",
      "name" => "T100",
      "city" => "Denver",
      "state" => "Colorado",
      "avatar_sm" => "a url 1",
      "avatar_md" => "a url 2",
      "avatar_lg" => "a url 3",
      "birthdate" => "1983-08-16",
      "date_hired" => "2016-08-17",
      "department" => "a bad department"}
  end

  def test_assigns_all_the_attributes
    robot = Robot.new (robot_data)
    assert_equal 1001, robot.id
    assert_equal "T100", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "a url 1", robot.avatar_sm
    assert_equal "a url 2", robot.avatar_md
    assert_equal "a url 3", robot.avatar_lg
    assert_equal Date.parse("1983-08-16"), robot.birthdate
    assert_equal Date.parse("2016-08-17"), robot.date_hired
    assert_equal "a bad department", robot.department
  end

  def test_it_knows_its_age
    robot = Robot.new (robot_data)
    assert_equal 33, robot.age
  end

  def test_it_knows_its_year_hired
    robot = Robot.new (robot_data)
    assert_equal 2016, robot.year_hired
  end
end
