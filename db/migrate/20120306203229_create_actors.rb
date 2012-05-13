class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
    	t.integer :action_id
    	t.integer :person_id
      t.timestamps
    end
    add_index :actors, [:action_id,:person_id]
  end
end
