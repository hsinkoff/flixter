require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 test "course costs are valid" do
		user=FactoryGirl.create(:user)
		course = FactoryGirl.create(:course, :cost => 2.5)
		expected = 2.50
		actual = course.cost
		assert_equal expected, actual
	end	
	test "course titles are valid" do
		user = FactoryGirl.create(:user)
		course = FactoryGirl.create(:course, :title => "one")
		expected = "one"
		actual = course.title
		assert_equal expected, actual
	end		
	test "course descriptions are valid" do
		user = FactoryGirl.create(:user)
		course = FactoryGirl.create(:course, :description => "awesome")
		expected="awesome"
		actual =course.description
		assert_equal expected, actual
	end
end
