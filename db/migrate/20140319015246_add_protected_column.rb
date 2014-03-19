class AddProtectedColumn < ActiveRecord::Migration
  def change
  	add_column :posts, :board_id, :integer
  	add_column :posts, :board_name, :string
  	add_column :posts, :protected, :integer
  end
end
