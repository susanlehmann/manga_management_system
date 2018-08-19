class Manga < ApplicationRecord
  has_one :anime
  has_many :rates
  has_many :comments
  has_many :likes
  has_many :follows
  has_many :chapters
  has_many :composes
  has_many :authors, through: :composes
  has_many :manga_categories
  has_many :categories,through: :manga_categories

  scope :desc, -> {
    order updated_at: :desc
  }
  scope :order_manga, -> {order created_at: :desc}

  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :poster, ThumbnailUploader
end
