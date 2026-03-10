class AddOtpToCustomer < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :otp, :string
  end
end
