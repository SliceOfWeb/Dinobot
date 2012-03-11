class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name,  null: false 
      t.string :last_name,   null: false
      t.text :bio
      t.date :birthdate
      t.string :location
      t.boolean :allow_search, default: true
      t.integer :user_id      
      t.timestamps
    end
      add_index :profiles, :user_id
  end
end
