class AspectMembership < ActiveRecord::Base
	belongs_to :aspect
	belongs_to :person
end
