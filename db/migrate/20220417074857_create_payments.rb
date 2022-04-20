class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.string :token
      t.float :amount
      t.timestamps
    end
  end
end
