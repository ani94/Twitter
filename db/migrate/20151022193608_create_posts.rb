class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :post do |t|
      t.string :title
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :post
  end
end
