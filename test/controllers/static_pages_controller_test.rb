require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get guide" do
    get :guide
    assert_response :success
  end
  
  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get tos" do
    get :tos
    assert_response :success
  end
end
