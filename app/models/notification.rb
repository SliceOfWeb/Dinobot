class Notification < ActiveRecord::Base
	has_many :notification_items
	has_many :people, :through => :notification_items

end
