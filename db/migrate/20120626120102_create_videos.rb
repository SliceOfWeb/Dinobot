class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :title
     	t.text :description
     	t.string :link
     	t.integer :person_id		
      	t.timestamps
    end
    add_index :videos,:person_id
  end
end
