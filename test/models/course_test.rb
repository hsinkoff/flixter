require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "course costs are converted to dollars" do
		user=FactoryGirl.create(:user)
		course = FactoryGirl.create(:course, :cost => 2.5)
		expected = 2.50
		actual = course.cost
		assert_equal expected, actual
	end	
	test "course must have title" do
		Course.create(:title=>" ")
		assert :unprocessable_entity
	end
	test "course must have description" do
		Course.create(:description =>" ")
		assert :unprocessable_entity
	end
	test "course must have cost" do
		Course.create(:cost=>" ")
		assert :unprocessable_entity
	end
	test "course created with title, description, and cost" do
		Course.create(:title=>"title", :description=>"description", :cost=> "2")
		assert :success
	end
end
