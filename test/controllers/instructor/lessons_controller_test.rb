require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "lessons can be created" do
  	user=FactoryGirl.create(:user)
    course=FactoryGirl.create(:course, :user=>user)
  	section=FactoryGirl.create(:section, :course=>course)
  	sign_in user
  	post :create, :section_id=>section.id, :lesson => {:title=>"lesson 1"}
  	assert_redirected_to instructor_course_path(course.id)
  end
 
end
