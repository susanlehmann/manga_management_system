class User < ApplicationRecord
  require "csv"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  enum role: {user: 0, admin: 1}
  after_initialize :set_default_role, if: :new_record?

  has_many :rates
  has_many :follows
  has_many :comments
  has_many :likes

  def set_default_role
    self.role ||= :user
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user |
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end
end
