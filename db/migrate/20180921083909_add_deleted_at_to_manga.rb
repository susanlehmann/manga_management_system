class AddDeletedAtToManga < ActiveRecord::Migration[5.2]
  def change
    add_column :mangas, :deleted_at, :datetime
    add_index :mangas, :deleted_at
  end
end
