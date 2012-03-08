class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.boolean :receive ,default: false
      t.boolean :share , default: false
      t.integer :user_id
      # t.timestamps
    end
    add_index :contacts, :user_id
  end
end
