class AddSlugToMangas < ActiveRecord::Migration[5.2]
  def change
    add_column :mangas, :slug, :string
    add_index :mangas, :slug, unique: true
  end
end
