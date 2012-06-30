class Conversation < ActiveRecord::Base
	
	has_many :messages
	has_many :conversation_statuses
	has_many :people, :through => :conversation_statuses

	belongs_to :receiver , :class_name => 'Person'
	belongs_to :sender ,  :class_name => 'Person'

end
