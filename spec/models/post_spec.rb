require 'spec_helper'

describe Post do
	it "has a valid factory" do
		FactoryGirl.create(:post).should be_valid 
	end

	it "post type is valid if it is video type" do
		FactoryGirl.create(:post, :post_type => "video").should be_valid 
	end

	it "post type is valid if it is photo type" do
		FactoryGirl.create(:post, :post_type => "photo").should be_valid 
	end

	it "post type is valid if it is link type" do
		FactoryGirl.create(:post, :post_type => "link").should be_valid 
	end

	it "post type is invalid if it is anything else" do
		FactoryGirl.build(:post, :post_type => "else").should_not be_valid 
	end

	it "post content must be less than 500 character " do
		FactoryGirl.build(:post, :content => "something less than 500").should be_valid 
	end

	it "post content must not be more than 500 character " do
		FactoryGirl.build(:post, :content => "over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 over 500 ").should_not be_valid 
	end

	it "each post belongs to a person" do
		person = FactoryGirl.create(:person)
		FactoryGirl.create(:post, :person_id => person.id).person.should == person
	end

end