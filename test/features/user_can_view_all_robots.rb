require_relative "../test_helper"

class UserCanViewAllRobots < FeatureTest

  def setup
    make_ten_robots
  end

  def test_user_can_view_all_robots
    visit '/'
    robot_tiles = page.all('.robot_tile')
    assert_equal 10, robot_tiles.length

    robot_tiles.each do |tile|
      assert_equal true, tile.has_css?('img')
    end
  end

end
