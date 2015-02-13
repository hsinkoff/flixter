require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "instructor can create sections" do
    #failure returned 500
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course)
    section = Section.create(:title=>"section 1")
    post :create, :instructor => user, :course=>course, :course_id=>course.id, :section =>section
    assert_response :success
  end
  test "instructor can update sections" do 
    #error undefined method for 'user'----same error if I use put or patch
    user = FactoryGirl.create(:user)
    sign_in user
    section = Section.create(:title=>"section 2")
    patch :update, :instructor=>user, :section =>section, :id=> section.id
    assert_response :success
  end
end
