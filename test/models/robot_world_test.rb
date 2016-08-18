require_relative "../test_helper"

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_world.all.last.id
  end

  def data_for_one_robot
    {:name => "T101", :city => "Denver", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"}
  end

  def create_task
    robot_world.create(data_for_one_robot)
  end

  def number_of_robots
    robot_world.all.length
  end

  def make_ten_tasks
    data_for_ten_robots.each { |data| robot_world.create(data) }
  end

  def test_it_creates_a_robot
    assert_equal 0, number_of_robots

    create_task
    robot = robot_world.find(current_robot_id)

    assert_equal 1, number_of_robots
  end

  def test_it_returns_all_robots
    assert_equal 0, number_of_robots

    make_ten_tasks

    assert_equal 10, number_of_robots
  end

  def test_it_finds_a_robot
    create_task
    robot = robot_world.find(current_robot_id)

    assert_instance_of Robot, robot
  end

  def test_it_generates_id
    assert_equal 1002, robot_world.generate_id([{"id"=>1001}])
  end

  def test_it_generates_urls
    url_1 = "https://robohash.org/helloworld/?set=set3&size=300x300"
    assert_equal url_1, robot_world.generate_avatar(300, "helloworld")
  end

  def test_it_updates_a_robot
    create_task
    assert_equal "Denver", robot_world.find(current_robot_id).city

    robot_world.update(current_robot_id, {:name => "T101", :city => "BOULDER", :state => "Colorado",
      :birthdate => "2015-08-16", :date_hired => "2016-08-17",
      :department => "a bad department"})

    assert_equal "BOULDER", robot_world.find(current_robot_id).city
  end

  def test_it_can_delete_a_robot
    create_task
    assert_equal 1, number_of_robots

    robot_world.delete(current_robot_id)

    assert_equal 0, number_of_robots
  end

  def test_it_can_delete_all_robots
    assert_equal 0, number_of_robots

    make_ten_tasks
    assert_equal 10, number_of_robots

    robot_world.delete_all
    assert_equal 0, number_of_robots
  end

end
