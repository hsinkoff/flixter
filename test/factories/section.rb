FactoryGirl.define do
	factory :section do
		title "section 1"
		
		association :course	
	end
end