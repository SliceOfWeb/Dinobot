class Image < ActiveRecord::Base
	belongs_to :album
	has_attached_file :image, :styles => {:thumb => '150x150#', :album_cover => '260x180#'}
end 
