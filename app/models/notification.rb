class Notification < ActiveRecord::Base
	belongs_to :person
	belongs_to :notifier , :class_name => 'Person'
	validates :target_type, :inclusion => { :in => %w(Follower Message Comment Action) }
	

end
