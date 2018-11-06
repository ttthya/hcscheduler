require 'test_helper'

class ScheduleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schedule_index_url
    assert_response :success
  end

  test "should get show" do
    get schedule_show_url
    assert_response :success
  end

  test "should get new" do
    get schedule_new_url
    assert_response :success
  end

  test "should get edit" do
    get schedule_edit_url
    assert_response :success
  end

end
