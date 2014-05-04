require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do 
  	user = User.new
  	assert !user.save, "Must enter first name"
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do 
  	user = User.new
  	assert !user.save, "Must enter last name"
  	assert !user.errors[:last_name].empty?
  end

  test "user should have a unique profile name" do
  	user = User.new
  	user.email = users(:pat).email
		

  	assert !user.save
  	assert !user.errors[:email].empty?
  end

  
end
