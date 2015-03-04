class CreateArticleTemplates < ActiveRecord::Migration
  def change
    create_table :article_templates do |t|
      t.string :name
      t.string :html
					t.references :article
					
      t.timestamps null: false
    end
    add_foreign_key :article_templates, :articles
  end
end
