class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content , null: false
    	t.integer :post_id
    	t.integer :person_id
     	 t.timestamps
    end
    add_index :comments,:post_id
    add_index :comments,:person_id
  	end
end
