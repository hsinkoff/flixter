require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "root page opens" do
		get :index
		assert :success
	end
	test "privacy policy opens" do
		get :privacy
		assert :success
	end
	test "team page opens" do
 		get :team
		assert :success
	end
	test "careers page opens" do
		get :careers
		assert :success
	end
	
	
end
