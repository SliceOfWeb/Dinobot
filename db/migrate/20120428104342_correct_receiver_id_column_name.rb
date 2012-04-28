class CorrectReceiverIdColumnName < ActiveRecord::Migration
  rename_column :conversations, :reciver_id, :receiver_id
end
