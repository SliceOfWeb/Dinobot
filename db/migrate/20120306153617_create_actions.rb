class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    	t.string :target_type, null:false
    	t.integer :up_vote_count
    	t.integer :down_vote_count
      t.integer :post_id
      t.timestamps
    end
      add_index :actions,:post_id
  end
end

	