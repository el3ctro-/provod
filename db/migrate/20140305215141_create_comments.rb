class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.references :comment, index: true
      t.text :words
      t.integer :votes
	  t.string :user_name
      t.timestamps
    end
  end
end
