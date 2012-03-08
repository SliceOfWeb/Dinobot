class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	# t.string :post_type , null: false
    	# t.string :url_title
    	# t.string :video_url 
    	# t.string :photo_url 
    	# t.string :link_url 
    	t.text :content , null: false
      t.integer :person_id
      t.integer :group_id
      # t.timestamps
    end
    add_index :posts, :person_id
    add_index :posts, :group_id
  end
end
