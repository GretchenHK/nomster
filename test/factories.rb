FactoryGirl.define do

	factory :user do
		sequence :email do |n|
			 "test#{n}@gmail.com"
		end

		password "testy123"
		password confirmation "testy123"
	end

	factory :comment do	
		message "yummy yummy in my tummy"
		rating "2_stars"
		association :user
		association :place
	end

	factory :place do
		name "McDonalds"
		description "junk food"
		address "123 main st, westfield, ma 01085"
		association :user
	end

end