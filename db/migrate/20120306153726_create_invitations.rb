class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.string :email
    	t.text :message
    	t.integer :person_id
      # t.timestamps
    end
    add_index :invitations, :person_id
  end
end