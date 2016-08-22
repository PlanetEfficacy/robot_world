require_relative "../test_helper"

class UserCanDeleteARobot < FeatureTest

  def setup
    make_ten_robots
  end

  def test_user_can_delete_robot
    visit '/'
    robot_tiles = page.all('.robot_tile')
    assert_equal 10, robot_tiles.length

    robot_tiles.first.click
    assert_equal true, page.has_content?("T1000")

    within(".col-md-offset-7") {
      find('.btn-danger').click
      assert_equal "/robots", current_path
    }

    robot_tiles = page.all('.robot_tile')
    assert_equal 9, robot_tiles.length
  end

end
