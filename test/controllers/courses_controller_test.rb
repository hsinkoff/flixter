require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
	test "courses are created" do
		user = FactoryGirl.create(:user)
		sign_in user
		course = FactoryGirl.create(:course)
			get :show, :instructor => user, :course => course, :id => course.id
			assert_response :success
		end
	
  # test "the truth" do
  #   assert true
  # end
end
