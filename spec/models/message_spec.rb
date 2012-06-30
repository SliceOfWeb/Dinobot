require 'spec_helper'

describe Message do
	it "has a valid factory" do
		FactoryGirl.create(:message).should be_valid 
	end

	it "each message belongs to only one person" do
		person = FactoryGirl.create :person
		FactoryGirl.create(:message, :person_id => person.id).person.should == person
	end

	it "message content must be in range {1..300} " do
	  FactoryGirl.build(:message, :content => "more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 ").should_not be_valid
	end

	it "message content must be in range {1..300} " do
	  FactoryGirl.build(:message, :content => "something less than 300").should be_valid
	end

	it "message content must be in range {1..300} " do
	  FactoryGirl.build(:message, :content => "").should_not be_valid
	end
end