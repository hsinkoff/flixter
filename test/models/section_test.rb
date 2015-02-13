require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "section created" do
  	course=FactoryGirl.create(:course)
  	Section.create(:title=>"title", :course_id=>course.id)
  	assert :success
  end
end
