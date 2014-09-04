require 'test_helper'

class Api::YellowControllerTest < ActionController::TestCase
  test "should get GetBussinessDetail" do
    get :GetBussinessDetail
    assert_response :success
  end

  test "should get FindBusiness" do
    get :FindBusiness
    assert_response :success
  end

  test "should get FindDealer" do
    get :FindDealer
    assert_response :success
  end

end
