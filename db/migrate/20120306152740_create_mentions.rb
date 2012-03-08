class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
    	t.integer :person_id
    	t.integer :post_id
      # t.timestamps
    end
    add_index :mentions, [:person_id,:post_id]
  end
end
