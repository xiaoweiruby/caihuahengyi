class CreatePostlists < ActiveRecord::Migration[5.0]
  def change
    create_table :postlists do |t|
      t.string :title
      t.text :body
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
