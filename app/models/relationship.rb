class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: Manga.name
  validates_presence_of :follower_id
  validates_presence_of :followed_id
end
