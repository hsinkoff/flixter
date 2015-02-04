require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
	test "courses are created" do
		user = FactoryGirl.create(:user)
		sign_in user
		course = FactoryGirl.create(:course)
			get :show, :instructor => user, :course => course, :id => course.id
			assert_response :success
		end
	test "course titles are valid" do
		user = FactoryGirl.create(:user)
		sign_in user
		course = FactoryGirl.create(:course, :title => "one")
		expected = "one"
		actual = course.title
		assert_equal expected, actual
	end		
	test "course descriptions are valid" do
		user = FactoryGirl.create(:user)
		sign_in user
		course = FactoryGirl.create(:course, :description => "awesome")
		expected="awesome"
		actual =course.description
		assert_equal expected, actual
	end
	test "course costs are valid" do
		user=FactoryGirl.create(:user)
		sign_in user
		course = FactoryGirl.create(:course, :cost => 2.5)
		expected = 2.50
		actual = course.cost
		assert_equal expected, actual
	end

  # test "the truth" do
  #   assert true
  # end
end
