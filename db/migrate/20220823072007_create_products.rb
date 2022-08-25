class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :product_details, null: false
      t.integer :cost, null: false
      

      t.timestamps
    end
  end
end
