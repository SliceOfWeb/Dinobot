class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.integer :reciver_id, null: false
    	t.integer :sender_id, null: false
    	t.string :subject, null: false  	
      # t.timestamps
    end
    add_index :conversations, :reciver_id
    add_index :conversations, :sender_id
  end
end
