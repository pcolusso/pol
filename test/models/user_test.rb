require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Test User", email: "test@test.com", level: 1, password: "blahblah")
	end

	test "should be vaild" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = '    '
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = '   '
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = 'a' * 51
		assert_not @user.valid?
	end

	test "email too long?" do
		@user.email = 'a' * 2000 + "@example.com"
		assert_not @user.valid?
	end

	test "email addresses should be unique" do
    	duplicate_user = @user.dup
    	duplicate_user.email = @user.email.upcase
    	@user.save
    	assert_not duplicate_user.valid?
  	end

  	test "password should have min length" do
  		@user.password = 'w'
  		assert_not @user.valid?
  	end
  
  test "email should be lowercase" do
    email_uppercase = "UPPERCASE@EXAMPLE.COM"
    @user.email = email_uppercase
    @user.save
    assert_equal email_uppercase.downcase, @user.reload.email
  end
end