class Album < ActiveRecord::Base
	belongs_to :person
	has_many :images
	has_one :action, :as => :target
	has_many :comments, :as => :commentary
end
