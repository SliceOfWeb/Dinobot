class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    	t.string :target_type, null:false
      t.integer :target_id
    	t.integer :upvote_count
    	t.integer :downvote_count
      t.timestamps
    end
      add_index :actions,:target_id
  end
end

	