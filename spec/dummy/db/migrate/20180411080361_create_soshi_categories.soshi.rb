# This migration comes from soshi (originally 20180409090902)
class CreateSoshiCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :soshi_categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :soshi_categories, :slug, unique: true
  end
end
