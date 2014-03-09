class CreateThumbs < ActiveRecord::Migration
  def change
    create_table :thumbs do |t|
      t.integer :comment_id
      t.integer :up_or_down
      t.integer :user_id

      t.timestamps
    end
  end
end
