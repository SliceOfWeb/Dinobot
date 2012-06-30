# spec/models/user.rb
require 'spec_helper'

describe User do
	it "has a valid factory" do
		user = User.create!({:username => "user_12", :email=> "email@domain.com", :password=>"123456"})
  		user.should be_valid
	end

	it "is invalid without a username" do
		FactoryGirl.build(:user, :username => nil).should_not be_valid 
	end

	it "is invalid if password less than 6" do	
		FactoryGirl.build(:user, :password => "12345").should_not be_valid 
	end

  	it "return user object if the username matche with password" do
  		user = FactoryGirl.create(:user)
  		User.authenticate("ahmd","123456").should == user
	end

	it "clear the password" do
  		user = FactoryGirl.create(:user)
  		user.clear_password.should == nil
	end

	it "each user connected to a profile" do
		profile = FactoryGirl.create(:profile)
		FactoryGirl.create(:user, :profile => profile).should be_valid
	end

	it "each user connected to a person" do
		person = FactoryGirl.create(:person)
		FactoryGirl.create(:user, :person => person).should be_valid
	end
end

