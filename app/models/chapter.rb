class Chapter < ApplicationRecord
  belongs_to :manga
  has_many :pages
  acts_as_paranoid

  mount_uploader :images, ThumbnailUploader

  scope :next_chapter, -> (id){
    where("id > ?", id).order(id: :asc)
  }

  scope :previous_chapter, -> (id){
    where("id < ?", id).order(id: :desc)
  }

  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]

  def should_generate_new_friendly_id?
    name_changed? || super
  end

  def next
    Chapter.where("id > ?", id).order(id: :asc).first
  end

  def prev
    Chapter.where("id < ?", id).order(id: :asc).last
  end
end
