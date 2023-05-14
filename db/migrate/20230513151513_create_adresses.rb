class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.text :addressee, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
