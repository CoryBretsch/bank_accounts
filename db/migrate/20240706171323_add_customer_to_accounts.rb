class AddCustomerToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :customer, null: false, foreign_key: true
  end
end
