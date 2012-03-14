class Invitation < ActiveRecord::Base
	belong_to :person
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :message, :format => { :maximum => 200 }
end
