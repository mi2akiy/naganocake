class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.text :addressee, null: false
      t.string :address, null: false
      t.integer :freight, null: false
      t.integer :payment, null: false
      t.integer :amount_claimed, null: false
      t.timestamps
    end
  end
end
