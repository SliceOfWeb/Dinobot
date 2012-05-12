class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.string :title
     	t.text :description
     	t.text :location
      	t.integer :person_id
      	t.string :cover_url
     	t.timestamps    
  	end
    add_index :albums,:person_id
  end
end
