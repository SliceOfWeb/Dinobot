class CreateNotificationItems < ActiveRecord::Migration
  def change
    create_table :notification_items do |t|
		t.integer :person_id
		t.integer :notification_id
      # t.timestamps
    end
    add_index :notification_items, [:notification_id,:person_id]
  end
end
