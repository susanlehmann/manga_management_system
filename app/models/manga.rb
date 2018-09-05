class Manga < ApplicationRecord
  has_one :anime
  has_many :rates
  has_many :comments
  has_many :likes
  has_many :chapters
  has_many :composes
  has_many :authors, through: :composes
  has_many :manga_categories
  has_many :categories,through: :manga_categories
  has_many :passive_relationships, class_name:  Relationship.name,
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  scope :order_manga, -> {order created_at: :desc}
  scope :most_view, -> {order number_of_read: :desc}
  scope :top_rate, -> {order average_rate: :desc}

  mount_uploader :thumbnail, ThumbnailUploader
  mount_uploader :poster, ThumbnailUploader
end
