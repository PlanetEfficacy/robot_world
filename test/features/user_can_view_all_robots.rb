require_relative "../test_helper"

class UserCanViewAllRobots < FeatureTest
  def test_user_can_view_all_robots
    visit '/'

    assert_equal '/robots', current_path

    save_and_open_page
  end

end
