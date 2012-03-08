class ActionItem < ActiveRecord::Base
	belongs_to :person
	belongs_to :action
end
