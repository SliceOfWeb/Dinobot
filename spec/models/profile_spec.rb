require 'spec_helper'

describe Profile do
	it "has a valid factory" do
		FactoryGirl.create(:profile).should be_valid
	end

	it "first name must be in range {3..20}" do
		FactoryGirl.create(:profile).should be_valid
	end

	it "last name must be in range {3..20}" do
		FactoryGirl.create(:profile).should be_valid
	end

	it "each profile belongs to only one user" do
		user = FactoryGirl.create(:user)
		FactoryGirl.create(:profile, :user_id => user.id).user.should == user
	end
end