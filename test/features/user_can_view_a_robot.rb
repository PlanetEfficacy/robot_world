require_relative "../test_helper"

class UserCanViewARobot < FeatureTest
  def test_user_can_view_robot
    visit '/robots'

    assert_equal '/robots', current_path
    # find('TEST').click

    # save_and_open_page
    # assert page.has_css?('a')

    # assert_equal '/robots/1', current_path
    #
    #
    # click_link("a")
    #
    # save_and_open_page

    # within('.container col-md-offset-2 col-md-8') {
      # expect(page).to have_content('Copyright')
      # click_link("robot title")
    # }
    # assert page.has_content?("Nuclear Utility Bot")
  end

end
