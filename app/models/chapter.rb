class Chapter < ApplicationRecord
  belongs_to :manga
  acts_as_votable

  mount_uploader :images, ThumbnailUploader

  scope :next_chapter, -> (id){
    where("id > ?", id).order(id: :asc)
  }

  scope :previous_chapter, -> (id){
    where("id < ?", id).order(id: :desc)
  }

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
