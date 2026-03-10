class AddAdmintoEvent < ActiveRecord::Migration[8.1]
  def change
    add_reference :events, :admin, null: false, foreign_key: { to_table: :users}
  end
end
