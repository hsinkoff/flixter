require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "lesson created" do
  	section=FactoryGirl.create(:section)
  	Lesson.create(:title=>"title", :section_id=>section.id)
  	assert :success
  end
end
