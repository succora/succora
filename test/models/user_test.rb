require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "a user should enter a first name" do 

  	assert !user.save

  	assert !user.errors[:first_name].empty?
  end
end
