class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
		  t.string :target_type
		  t.string :target_url
	   	t.boolean :read
	   	t.integer :person_id
      t.integer :notifier_id
    	t.timestamps
    end
    add_index :notifications, :person_id
    add_index :notifications, :notifier_id
  end
end
