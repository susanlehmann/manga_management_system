class ChangeStatusInManga < ActiveRecord::Migration[5.2]
  def change
    change_column :mangas, :status, :integer, :default => 0
  end
end
