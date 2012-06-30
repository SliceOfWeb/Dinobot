require 'spec_helper'

describe Comment do
	it "has a valid factory" do
		FactoryGirl.create(:comment).should be_valid  
	end

	it "comment content should not be more than 300" do
	  FactoryGirl.build(:comment,:content=>"more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 more than 300 ").should_not be_valid
	end

	it "comment content should not be more than 300" do
	  FactoryGirl.build(:comment,:content=>"something less than 300 ").should be_valid
	end

	it "each comment must belong to a person" do
	  person = FactoryGirl.create(:person)
	  FactoryGirl.create(:comment, :person_id => person.id).person.should == person
	end

end