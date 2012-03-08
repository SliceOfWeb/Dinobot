class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :group_name, null: false
    	t.text :descripton, null: false
      # t.timestamps
    end
  end
end
