require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
	test "courses viewable by students" do
		user = FactoryGirl.create(:user)
		sign_in user
		course = FactoryGirl.create(:course)
		get :show, :course => course, :id => course.id
		assert_response :success
  	end
  	test "user can view all courses in index" do
  		user = FactoryGirl.create(:user)
		sign_in user
		get :index
		assert_response :success
	end
	test "user not signed in-can see course" do
		course = FactoryGirl.create(:course)
		get :show, :course => course, :id => course.id
		assert_response :success
	end
	test "user not signed in-can see course index" do
		get :index
		assert_response :success
	end

  # test "the truth" do
  #   assert true
  # end
end
