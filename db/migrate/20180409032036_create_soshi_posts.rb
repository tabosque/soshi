class CreateSoshiPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :soshi_posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.string :description, null: false
      t.attachment :image
      t.integer :status, default: 0
      t.timestamps
      t.datetime :published_at
      t.datetime :deleted_at
    end
    add_index :soshi_posts, :category_id
  end
end
