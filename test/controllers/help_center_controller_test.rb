require 'test_helper'

class HelpCenterControllerTest < ActionController::TestCase
  test "should get our_network" do
    get :our_network
    assert_response :success
  end

end
