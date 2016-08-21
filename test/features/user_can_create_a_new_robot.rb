require_relative "../test_helper"

class UserCanCreateRobot < FeatureTest
  def test_user_can_create_robot
    visit '/'
    click_link("Add Robot")
    assert_equal '/robots/new', current_path

    fill_in("Name", :with => "Robocop")
    fill_in("City", :with => "Denver")
    fill_in("State", :with => "Colorado")
    fill_in("Dept", :with => "A department")
    fill_in("DOB", :with => "1989-01-01")
    fill_in("DOH", :with => "1999-01-01")
    # save_and_open_page
    click_on('Submit')

    assert_equal '/robots', current_path
  end

end
