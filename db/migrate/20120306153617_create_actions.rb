class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
    	t.references :target, :polymorphic => true
      t.timestamps
    end
      add_index :actions,:target_id
  end
end

	