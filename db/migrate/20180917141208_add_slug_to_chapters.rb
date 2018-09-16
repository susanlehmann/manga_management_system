class AddSlugToChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :slug, :string
    add_index :chapters, :slug
  end
end
