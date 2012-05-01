class CreateAspectMemberships < ActiveRecord::Migration
  	def change
	    create_table :aspect_memberships do |t|
	    	t.integer :aspect_id
	    	t.integer :person_id
	      t.timestamps
	    end
	    add_index :aspect_memberships, [:aspect_id,:person_id]
  	end
end
