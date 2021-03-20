require 'test_helper'

class CookedRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cooked_records_create_url
    assert_response :success
  end

  test "should get destroy" do
    get cooked_records_destroy_url
    assert_response :success
  end

end
