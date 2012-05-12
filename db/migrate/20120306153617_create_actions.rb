class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    	t.references :target, :polymorphic => true
    	t.integer :upvote_count
    	t.integer :downvote_count
      t.timestamps
    end
      add_index :actions,:target_id
  end
end

	