class Conversation < ActiveRecord::Base
	has_many :messages
	belongs_to :reciver , :class_name => 'User' #Person instead of User
	belongs_to :sender ,  :class_name => 'User' #Person instead of User
end
