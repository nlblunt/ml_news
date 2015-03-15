class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :category
      t.boolean :major
      t.attachment :display_img
      t.string :caption
      t.references :author, index: true
      t.references :category, index: true
      t.timestamps null: false
    end
    add_foreign_key :articles, :authors
    add_foreign_key :articles, :category
  end
end
