class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :body
      t.attachment :display_img
      t.attachment :news_img
      t.references :article_template, index: true
      t.references :author, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :article_templates
    add_foreign_key :articles, :authors
  end
end
