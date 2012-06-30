require 'spec_helper'

describe Notification do
	it "has a valid factory" do
		FactoryGirl.create(:notification).should be_valid 
	end

	it "target_type attribute in each notification could be" do
		FactoryGirl.create(:notification, :target_type => "Message").should be_valid
	end

	it "target_type attribute in each notification could be" do
		FactoryGirl.create(:notification, :target_type => "Message").should be_valid
	end

	it "target_type attribute in each notification could be" do
		FactoryGirl.create(:notification, :target_type => "Comment").should be_valid
	end

	it "target_type attribute in each notification could be" do
		FactoryGirl.create(:notification, :target_type => "Action").should be_valid
	end

	it "each notification should be related to on person" do
	  person = FactoryGirl.create(:person)
	  notification = FactoryGirl.create(:notification, :person_id => person.id).person.should == person

	end
	 
end