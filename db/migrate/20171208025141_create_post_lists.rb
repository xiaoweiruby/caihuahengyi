class CreatePostLists < ActiveRecord::Migration[5.0]
  def change
    create_table :post_lists do |t|
      t.integer :order_id
       t.string  :post_name
       t.integer :post_price
       t.integer :quantity
      t.timestamps
    end
  end
end
