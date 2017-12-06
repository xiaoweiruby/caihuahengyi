class AddQuantityToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :quantity, :integer, default: 1
  end
end
