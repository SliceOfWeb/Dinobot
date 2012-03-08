class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.integer :conversation_id 
    	t.text :content, null: false
    	t.integer :person_id
      # t.timestamps
    end
    add_index :messages, :person_id
    add_index :messages, :conversation_id
  end
end
