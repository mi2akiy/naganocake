class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.string :postal_code
      t.text :addressee
      t.string :address
      t.timestamps
    end
  end
end
