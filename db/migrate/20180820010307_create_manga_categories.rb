class CreateMangaCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :manga_categories do |t|
      t.references :manga, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
