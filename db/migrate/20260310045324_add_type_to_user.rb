class AddTypeToUser < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :type, :string
    remove_column :users, :role, :integer
  end
end
