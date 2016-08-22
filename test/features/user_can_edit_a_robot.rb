require_relative "../test_helper"

class UserCanEditARobot < FeatureTest

  def setup
    make_ten_robots
  end

  def test_user_can_edit_robot
    visit '/'
    robot_tiles = page.all('.robot_tile')
    assert_equal 10, robot_tiles.length

    robot_tiles.first.click
    assert_equal true, page.has_content?("T1000")

    within(".col-md-offset-7") {
      robot_id = robot_world.all.first.id
      find('a').click
      assert_equal "/robots/#{robot_id}/edit", current_path
    }

    assert_equal true, page.has_css?("#inputName")
    fill_in("Name", :with => "Robocop")
    within(".btn-group") { find('.btn-primary').click }
    assert_equal true, page.has_content?("Robocop")
  end

end
