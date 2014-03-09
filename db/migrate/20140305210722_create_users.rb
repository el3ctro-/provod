class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :user, index: true
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamp :timestamp
      t.integer :score
      t.integer :permission

      t.timestamps
    end
  end
end
