class CreateAspectVisibilities < ActiveRecord::Migration
  def change
    create_table :aspect_visibilities do |t|
    	t.integer :aspect_id
    	t.integer :post_id
        t.timestamps
    end
    add_index :aspect_visibilities, [:aspect_id,:post_id]
  end
end
