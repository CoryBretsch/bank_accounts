class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.integer :balance
      t.boolean :has_veteran_status
      
      t.timestamps
    end
  end
end
