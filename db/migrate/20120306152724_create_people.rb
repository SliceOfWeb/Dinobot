class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
    	t.string :profile_link , null: false
    	t.integer :user_id
      # t.timestamps
    end
    add_index :people, :user_id
  end
end
