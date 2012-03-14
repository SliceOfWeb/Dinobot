class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username 
    	t.string :email
    	t.string :hashed_password 
    	t.string :salt
      	t.timestamps
    end
  end
end
