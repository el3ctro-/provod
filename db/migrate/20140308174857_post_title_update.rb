class PostTitleUpdate < ActiveRecord::Migration
  def change
  add_column :posts, :type, :string
  end
end
