require 'test_helper'

class UploaderControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get uploader_form_url
    assert_response :success
  end

end
