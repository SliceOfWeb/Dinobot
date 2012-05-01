class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.integer :receiver_id, null: false
    	t.integer :sender_id, null: false
    	t.string :subject, null: false, :default => "no subject"
      t.timestamps
    end
    add_index :conversations, :receiver_id
    add_index :conversations, :sender_id
  end
end
