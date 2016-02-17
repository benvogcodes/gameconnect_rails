class User < ActiveRecord::Base
  has_secure_password

  has_many :favorites, dependent: :destroy
  has_many :games, through: :favorites, dependent: :destroy

  validates :username, prescence: true
  validates :username, uniqueness: true

  validates :email, prescence: true
  validates :email, uniqueness: true

  validates :password, prescence: true

end
