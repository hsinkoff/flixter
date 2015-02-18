require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "instructor can create sections" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course, :user=>user)
    sign_in user
    post :create, :course_id => course.id, :section => {:title=>"section 1"}
    assert_redirected_to instructor_course_path(course.id)
  end

end
