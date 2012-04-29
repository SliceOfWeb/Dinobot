class AlterContactsWithPeople < ActiveRecord::Migration
  def up
  	rename_column(:aspect_memberships, :contact_id, :person_id)
  	rename_index(:aspect_memberships ,[:aspect_id,:contact_id],[:aspect_id,:person_id])

  end

  def down
  	rename_index(:aspect_memberships ,[:aspect_id,:person_id],[:aspect_id,:contact_id])
  	rename_column(:aspect_memberships, :person_id, :contact_id)
  end
end
