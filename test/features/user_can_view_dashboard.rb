require_relative "../test_helper"

class UserCanViewRobotDashboard < FeatureTest

  def setup
    make_ten_robots
  end

  def test_user_can_view_robot_dashboard
    visit '/'
    click_link('Dashboard')

    assert_equal '/robots/dashboard', current_path
    assert_equal true, page.has_content?('Robot Age:')
    assert_equal true, page.has_content?('Count of Robots by State:')
    assert_equal true, page.has_content?('Count of Robots by City:')
    assert_equal true, page.has_content?('Count of Robots Hired by Year:')
    assert_equal true, page.has_content?('Count of Robots by Department:')

  end

end
