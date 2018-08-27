class Chapter < ApplicationRecord
  belongs_to :manga

  mount_uploader :images, ThumbnailUploader

  scope :next_chapter, -> (id){
    where("id > ?", id).order(id: :asc)
  }

  scope :previous_chapter, -> (id){
    where("id < ?", id).order(id: :desc)
  }
end
