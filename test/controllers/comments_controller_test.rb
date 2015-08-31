require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test 'comment_creation' do
		user = FactoryGirl.create(:user)
		sign_in user
		place = FactoryGirl.create(:place)

		assert_difference 'Comment.count' do
			post :create, :place_id => place.id, :comment => {
				:message => 'yummy yummy in my tummy',
				:rating => '2_stars'
				}
			
		end
		assert_redirected_to place_path(place)
		assert_equal 1, place.comments.count
	end
end
