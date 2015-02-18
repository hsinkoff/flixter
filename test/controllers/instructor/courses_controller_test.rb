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
  	user = FactoryGirl.create(:user)
  	sign_in user
    post :create, :instructor => user.id, :course => {:title=>"course 1", :description => "awesome", :cost => "2"}
  	assert_redirected_to instructor_course_path(assigns(:course))
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
		get :show, :id=> course.id
		assert_response :success
	end
	test "course not show to user who isn't the instructor" do
		user = FactoryGirl.create(:user)
		instructor= FactoryGirl.create(:user)
		sign_in user
		course=FactoryGirl.create(:course, :user=>instructor)
		get :show, :id=> course.id
		assert_response :unauthorized, @response.body
	end	
	
end
