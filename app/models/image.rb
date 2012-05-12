class Image < ActiveRecord::Base
	belongs_to :album
	has_one :action, :as => :target
	has_many :comments, :as => :commentary
	has_attached_file :image, :styles => {:thumb => '150x150#', :album_cover => '260x180#'}
end 
