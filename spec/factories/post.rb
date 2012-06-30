FactoryGirl.define do
  factory :post do |f|
  	f.post_type "status"
  	f.content "some post text"
  	f.person_id nil
  end
end