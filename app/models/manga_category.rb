class MangaCategory < ApplicationRecord
  belongs_to :manga
  belongs_to :category
end
