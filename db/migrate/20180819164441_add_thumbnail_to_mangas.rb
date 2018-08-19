class AddThumbnailToMangas < ActiveRecord::Migration[5.2]
  def change
    add_column :mangas, :poster, :string
    add_column :mangas, :thumbnail, :string
    add_column :mangas, :country, :string
  end
end
