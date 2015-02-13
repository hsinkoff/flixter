require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "dashboard is shown" do
  	user =FactoryGirl.create(:user)
  	sign_in user
  	get :show
  	assert_response :success
  end
  test "dashboard not show-user not signed in" do
  	get :show
  	assert_redirected_to new_user_session_path
  end
end
