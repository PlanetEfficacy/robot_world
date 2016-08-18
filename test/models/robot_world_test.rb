require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_world.create({:name => "T101", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"})
    robot = robot_world.find(1001)
    assert_equal 1001, robot.id
    assert_equal "T101", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal Date.parse("2015-08-16"), robot.birthdate
    assert_equal Date.parse("2016-08-17"), robot.date_hired
    assert_equal "a bad department", robot.department
  end

  def test_it_generates_id
    assert_equal 1002, robot_world.generate_id([{"id"=>1001}])
  end

  def test_it_generates_urls
    url_1 = "https://robohash.org/helloworld/?set=set3&size=300x300"
    assert_equal url_1, robot_world.generate_avatar(300, "helloworld")
  end

end
