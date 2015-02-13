require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
    test "get form to create course" do
      user =FactoryGirl.create(:user)
      sign_in user
      get :new
      assert_response :success
    end
    test "cannot get form to create course-not signed in" do
      get :new
      assert_redirected_to new_user_session_path
    end
  	test "course created by instructor" do
      #error undefined method to do with course_params
  		user = FactoryGirl.create(:user)
  		sign_in user
  		course = Course.create(:title=>"course 1", :description => "awesome", :cost => "2")
      post :create, :instructor => user, :course => course
  		assert_response :success
  	end
  	test "course not created, user not signed in" do
  		user = FactoryGirl.create(:user)
  		course = Course.create(:title=>"course 1", :description => "awesome", :cost => "2", :user_id =>user.id)
  		post :create, :instructor => user, :course => course
  		assert_redirected_to new_user_session_path
  	end
  	test "course is shown to instructor" do
		user = FactoryGirl.create(:user)
		sign_in user
		course=FactoryGirl.create(:course, :user=>user)
		get :show, :instructor=> user, :course => course, :id=> course.id
		assert_response :success
	end
	test "course not show to user who isn't the instructor" do
		#failure html returns 500
		user = FactoryGirl.create(:user)
		user2= FactoryGirl.create(:user)
		sign_in user
		course=FactoryGirl.create(:course, :user=>user2)
		get :show, :instructor =>user2, :course =>course, :id => course.id
		assert_response :unprocessable_entity
		assert_redirected_to course_path
	end	
	
end
