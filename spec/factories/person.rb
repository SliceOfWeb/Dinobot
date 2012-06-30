FactoryGirl.define do
  factory :person do |f|
  	f.profile_link "/username"
  	f.user_id nil
  end
end