class CreateConversationStatuses < ActiveRecord::Migration
  def change
    create_table :conversation_statuses do |t|
      t.integer :conversation_id
      t.integer :person_id
      t.boolean :unread
      t.boolean :visibility

      t.timestamps
    end
  end
end
