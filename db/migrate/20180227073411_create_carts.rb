class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :user_id
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      
     	t.timestamps
    end
  end
end
