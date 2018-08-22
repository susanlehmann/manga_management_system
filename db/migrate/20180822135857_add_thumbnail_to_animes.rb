class AddThumbnailToAnimes < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :video_thumbnail, :string
  end
end
