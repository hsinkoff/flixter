FactoryGirl.define do
	factory :course do
		title "course 1"
		description "great course"
		cost 2.0

		association :user	
	end
end