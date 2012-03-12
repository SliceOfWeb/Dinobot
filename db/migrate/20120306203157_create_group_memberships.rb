class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
    	t.integer :group_id
    	t.integer :person_id
        t.timestamps
    end
    add_index :group_memberships, [:group_id,:person_id]
  end
end
