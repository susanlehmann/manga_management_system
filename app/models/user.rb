class User < ApplicationRecord
  has_many :rates
  has_many :follows
  has_many :comments
  has_many :likes
end
