class CreatePosts < ActiveRecord::Migration
  def change
  drop_table :posts
    create_table :posts do |t|
      t.integer :post
      t.integer :score
      t.text :words
      t.integer :user_id
	  t.string :title
	  t.string :link
      t.timestamps
    end
  end
end
