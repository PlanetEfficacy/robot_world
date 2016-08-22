require_relative "../test_helper"

class UserCanViewARobot < FeatureTest

  def setup
    make_ten_robots
  end

  def test_user_can_view_robot
    visit '/'
    robot_tiles = page.all('.robot_tile')
    assert_equal 10, robot_tiles.length

    robot_tiles.first.click
    assert_equal true, page.has_content?("T1000")

  end

end
