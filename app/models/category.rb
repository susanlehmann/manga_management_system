class Category < ApplicationRecord
  has_many :manga_categories
  has_many :mangas, through: :manga_categories
end
