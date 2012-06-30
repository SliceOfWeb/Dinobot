require 'spec_helper'

describe Person do
	it "has a valid factory" do
		user = FactoryGirl.create :user
		FactoryGirl.create(:person, :profile_link => user.username).should be_valid 
	end

	it "profile_link attribute cannot be nil" do
		Person.new(:profile_link => nil).should_not be_invalid 
	end

	it "each person belongs to only one user" do
		user = FactoryGirl.create :user
		FactoryGirl.create(:person, :profile_link => user.username, :user_id => user.id).user.should == user
	end
end