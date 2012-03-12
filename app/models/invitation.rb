class Invitation < ActiveRecord::Base
	belong_to :person
	validates :email, :format => { :with => /\A[a-zA-Z]+\z/ }
	validates :message, :format => { :maximum => 200 }
end
