class Anime < ApplicationRecord
  belongs_to :manga
  mount_uploader :video_thumbnail, ThumbnailUploader
end
