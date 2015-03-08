class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
