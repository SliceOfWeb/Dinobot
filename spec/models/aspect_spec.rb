require 'spec_helper'

describe Aspect do
	it "has a valid factory" do
		FactoryGirl.create(:aspect).should be_valid 
	end

	it "aspect name should be in range {3..20}" do
		FactoryGirl.build(:aspect, :name=>"asp").should_not be_invalid 
	end

	it "each aspcet belongs to a user" do
	  user = FactoryGirl.create(:user)
	  aspect = FactoryGirl.create(:aspect, :user_id => user.id)
	  user.aspects[0].should == aspect
	end

end