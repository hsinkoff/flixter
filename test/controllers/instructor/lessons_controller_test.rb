require 'test_helper'

class Instructor::LessonsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "lessons can be created" do
  	#error with params
  	user=FactoryGirl.create(:user)
    course=FactoryGirl.create(:course, :user=>user)
  	section=FactoryGirl.create(:section, :course=>course)
  	sign_in user
  	lesson=Lesson.create(:title=>"lesson 1")
  	post :create, :instructor=>user, :section =>section, :section_id=>section.id, :lesson=>lesson
  	assert_response :success
  end
  test "lessons can be updated" do
  	#error no matching route
  	user=FactoryGirl.create(:user)
  	section=FactoryGirl.create(:section)
  	sign_in user
  	lesson=Lesson.create(:title=>"lesson 1")
  	post :create, :instructor=>user, :lesson=>lesson, :id=>lesson.id
  	assert_response :success
  end
 
end
