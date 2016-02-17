require 'test_helper'

class FormControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get submit" do
    get :submit
    assert_response :success
  end

end
