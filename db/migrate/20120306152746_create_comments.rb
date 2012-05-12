class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content , null: false
      t.references :commentary, :polymorphic => true
    	t.integer :person_id
     	 t.timestamps
       
    end
    add_index :comments,:commentary_id
    add_index :comments,:person_id
  	end
end
