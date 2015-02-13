require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "lessons can be seen by user" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    sign_in user
    user.enrollments.create(:course=> course)
    section=FactoryGirl.create(:section, :course=>course)
    lesson = Lesson.create(:title =>"lesson 1", :section=>section)
    get :show, :lesson => lesson, :id=>lesson.id
    assert_response :found
  end
  	
end




