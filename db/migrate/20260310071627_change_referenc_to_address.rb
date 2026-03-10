class ChangeReferencToAddress < ActiveRecord::Migration[8.1]
  def change
    rename_column :addresses, :user_id, :customer_id
  end
end
