class CreateGroupAdmins < ActiveRecord::Migration
  def change
    create_table :group_admins do |t|
    	t.integer :group_id
    	t.integer :person_id
      # t.timestamps
    end
    add_index :group_admins, [:group_id,:person_id]
  end
end
