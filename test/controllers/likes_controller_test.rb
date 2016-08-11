require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  test "should get set" do
    get :set
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
