require 'test_helper'

class GoogleAuthsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get google_auths_new_url
    assert_response :success
  end

end
