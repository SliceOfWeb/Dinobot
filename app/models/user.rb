class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  has_one :person
  has_one :profile
  has_one :contact
  has_many :aspects
  
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  
end
