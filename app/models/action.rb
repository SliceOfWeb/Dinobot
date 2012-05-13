class Action < ActiveRecord::Base
	belongs_to :target, :polymorphic => true
	has_many :actors
	has_many :people, :through => :actors
end
