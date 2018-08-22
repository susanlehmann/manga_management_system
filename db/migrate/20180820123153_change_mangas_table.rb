class ChangeMangasTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :mangas, :category_id
  end
end
