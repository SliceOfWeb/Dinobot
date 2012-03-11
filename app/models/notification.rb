class Notification < ActiveRecord::Base
	has_many :notification_items
	has_many :people, :through => :notification_items
	validates :target_type, :inclusion => { :in => %w(friendship message comment action group) }
end
