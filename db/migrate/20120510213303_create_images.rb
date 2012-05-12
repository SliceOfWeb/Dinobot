class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
		t.string :caption
     	t.text	:location
    	t.integer	:album_id
    	t.string   :image_file_name
    	t.string   :image_content_type
    	t.integer  :image_file_size
    	t.datetime :image_updated_at
     	t.timestamps    
  	end
    add_index :images,:album_id
  end
end
