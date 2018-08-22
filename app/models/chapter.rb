class Chapter < ApplicationRecord
  belongs_to :manga

  delegate :category, :to => :manga

  mount_uploader :images, ThumbnailUploader
end
