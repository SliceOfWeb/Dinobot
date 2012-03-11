class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
      t.boolean :hidden , default: false
      t.string :name,  null: false
      t.integer :user_id
      t.timestamps
    end
    add_index :aspects, :user_id
  end
end
