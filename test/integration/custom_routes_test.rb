require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
test "that /signin route opens the signin page" do 
	get '/signin'
	assert_response :success
end

test "that /register route opens the sign up page" do 
	get '/register'
	assert_response :success
end

test "that a profile page works" do 
	get '/patsaunders'
	assert_response :success
end


end
