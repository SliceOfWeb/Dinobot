class CreateActionItems < ActiveRecord::Migration
  def change
    create_table :action_items do |t|
    	t.integer :action_id
    	t.integer :person_id
    	t.string :opinion 
    	t.string :vote
      t.timestamps
    end
    add_index :action_items, [:action_id,:person_id]
  end
end
