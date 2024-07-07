class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :birth_year
      t.boolean :is_veteran

      t.timestamps
    end
  end
end
