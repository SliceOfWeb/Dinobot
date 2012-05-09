class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.string :subject, null: false, :default => "no subject"
      t.timestamps
    end
  end
end
