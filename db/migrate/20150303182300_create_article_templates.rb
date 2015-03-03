class CreateArticleTemplates < ActiveRecord::Migration
  def change
    create_table :article_templates do |t|
      t.string :name
      t.string :html

      t.timestamps null: false
    end
  end
end
